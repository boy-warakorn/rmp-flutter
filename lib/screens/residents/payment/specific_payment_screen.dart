import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/card_button.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';

class SpecificPaymentScreen extends StatelessWidget {
  const SpecificPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(
              onPressed: () => print("Back"),
              color: kBlackColor,
            ),
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
                    const Expanded(child: SizedBox()),
                    CustomButton(
                      text: "UPLOAD RECEIPT",
                      onPressed: () => print("UPLOAD"),
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
