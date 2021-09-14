// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/residents/payment/confirm_payment_screen.dart';
import 'package:rmp_flutter/widgets/general/card_button.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class SpecificPaymentScreen extends StatelessWidget {
  static const routeName = "/resident/specific-payment";
  const SpecificPaymentScreen({Key? key}) : super(key: key);

  Future<void> _takePhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? slipPhoto =
        await _picker.pickImage(source: ImageSource.camera);
    print(slipPhoto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: BackAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(kSizeS * (1.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pay Electricity",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    kSizedBoxVerticalS,
                    Text(
                      "Amount  \$50000",
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
                      onPressed: () => _takePhoto,
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
