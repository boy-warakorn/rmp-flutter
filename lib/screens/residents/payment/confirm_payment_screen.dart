// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:path/path.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/payment.dart';
import 'package:rmp_flutter/repositories/payment_repository.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_result_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

const slip =
    "https://www.microsuck.net/wp-content/uploads/2019/09/1-592x1024.png";

class ConfirmPaymentScreen extends HookWidget {
  static const routeName = "/resident/confirm-payment";
  const ConfirmPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _arguments =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    final _photo = _arguments[0] as File;
    final _payment = _arguments[1] as Payment;
    final _isLoading = useState(false);

    Future<void> _uploadPhoto() async {
      final fileName = basename(_photo.path);

      try {
        _isLoading.value = true;
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('receipt/${_payment.id}/$fileName');
        await storageRef.putFile(_photo);
        final receiptUrl = await storageRef.getDownloadURL();
        PaymentRepository().paySpecificPayment(_payment.id, receiptUrl);
        Navigator.of(context).pushNamedAndRemoveUntil(
            PaymentResultScreen.routeName, (_) => false);
      } catch (e) {
        _isLoading.value = false;
      }
    }

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: BackAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(
                  kSizeS * (1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.file(_photo),
                      ),
                    ),
                    kSizedBoxVerticalS,
                    kSizedBoxVerticalXS,
                    CustomButton(
                      isLoading: _isLoading.value,
                      text: "SUBMIT RECEIPT",
                      onPressed: _uploadPhoto,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
