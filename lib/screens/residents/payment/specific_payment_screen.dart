// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/payment.dart';
import 'package:rmp_flutter/repositories/payment_repository.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_form_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/confirm_payment_screen.dart';
import 'package:rmp_flutter/widgets/general/card_button.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class SpecificPaymentScreen extends HookConsumerWidget {
  static const routeName = "/resident/specific-payment";
  const SpecificPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _paymentObj = ModalRoute.of(context)?.settings.arguments as Payment;
    final _isLoading = useState(false);
    final Image _photo;

    Future<void> _takePhoto() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? slipPhoto =
          await _picker.pickImage(source: ImageSource.camera);
      final _image = File(slipPhoto!.path);
      Navigator.of(context).pushNamed(
        ConfirmPaymentScreen.routeName,
        arguments: _image,
      );
    }

    Future<void> _openGallery() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? slipPhoto =
          await _picker.pickImage(source: ImageSource.gallery);
      final _image = File(slipPhoto!.path);
      Navigator.of(context).pushNamed(
        ConfirmPaymentScreen.routeName,
        arguments: _image,
      );
    }

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: BackAppBar(),
      body: SafeArea(
        child: _isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(kSizeS * (1.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pay ${_paymentObj.type}",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          kSizedBoxVerticalS,
                          Text(
                            "Amount  ${_paymentObj.amount} BAHT",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          kSizedBoxVerticalS,
                          kSizedBoxVerticalXS,
                          Row(
                            children: [
                              Expanded(
                                child: CardButton(
                                  title: "GET QR CODE",
                                  onPressed: () => print("QR"),
                                  icon: Icons.qr_code,
                                ),
                              ),
                              kSizedBoxHorizontalS,
                              kSizedBoxHorizontalXXS,
                              Expanded(
                                child: CardButton(
                                  title: "PHONE NUMBER",
                                  onPressed: () => print("phone"),
                                  icon: Icons.qr_code,
                                  backgroundColor: kWarningColor,
                                  useGradientBackground: false,
                                ),
                              ),
                            ],
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          CustomButton(
                            text: "UPLOAD RECEIPT",
                            onPressed: () {
                              showModalBottomSheet<dynamic>(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height:
                                        MediaQuery.of(context).size.width / 3,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: kSizeL * 1.5,
                                    ),
                                    child: Wrap(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            kSizedBoxVerticalS,
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: CustomButton(
                                                text: "Upload Photo",
                                                onPressed: () {
                                                  _openGallery();
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          ConfirmPaymentScreen
                                                              .routeName);
                                                },
                                                color: kWarningColor,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: kSizeS,
                                                  horizontal: kSizeS,
                                                ),
                                              ),
                                            ),
                                            kSizedBoxVerticalS,
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: CustomButton(
                                                text: "Take a photo",
                                                onPressed: () {
                                                  _takePhoto();
                                                },
                                                padding: EdgeInsets.symmetric(
                                                  vertical: kSizeS,
                                                  horizontal: kSizeS,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
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
