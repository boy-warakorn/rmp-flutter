// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';

const slip =
    "https://www.microsuck.net/wp-content/uploads/2019/09/1-592x1024.png";

class ConfirmPaymentScreen extends StatelessWidget {
  const ConfirmPaymentScreen({Key? key}) : super(key: key);

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
                padding: EdgeInsets.all(kSizeS * (1.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image(
                          image: NetworkImage(slip),
                        ),
                      ),
                    ),
                    kSizedBoxVerticalS,
                    kSizedBoxVerticalXS,
                    CustomButton(
                      text: "SUBMIT RECEIPT",
                      onPressed: () {},
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
