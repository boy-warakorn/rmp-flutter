import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';

class PaymentResultScreen extends StatelessWidget {
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
                    onPressed: () => print('Back to home'),
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