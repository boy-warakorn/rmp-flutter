import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/main_screen.dart';
import 'package:rmp_flutter/screens/residents/home_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';

class PaymentResultScreen extends StatelessWidget {
  static const routeName = "/resident/payment-result";
  const PaymentResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/8401.png",
              alignment: Alignment.center,
            ),
            kSizedBoxVerticalM,
            Text(
              'Payment Success!',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: kBlackColor,
                  ),
            ),
            kSizedBoxVerticalS,
            Text(
              'Please waiting for confirmation',
              style: Theme.of(context).textTheme.headline4,
            ),
            kSizedBoxVerticalM,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CustomButton(
                    text: "BACK TO HOME",
                    onPressed: () =>
                        Navigator.of(context).pushNamed(MainScreen.routeName),
                    padding: EdgeInsets.symmetric(
                      horizontal: kSizeS,
                      vertical: kSizeXS,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
