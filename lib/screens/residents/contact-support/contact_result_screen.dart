import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';

class ContactResultScreen extends StatelessWidget {
  static const routeName = "/resident/contact-result";
  const ContactResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
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
              'Thank for Helping us!',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: kBlackColor,
                  ),
            ),
            kSizedBoxVerticalXS,
            Text(
              'We will be reaching to you soon',
              style: Theme.of(context).textTheme.headline4,
            ),
            kSizedBoxVerticalM,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "BACK TO HOME",
                  onPressed: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil(
                          PreLoadingScreen.routeName, (_) => false),
                  padding: EdgeInsets.symmetric(
                    horizontal: kSizeS * 1.5,
                    vertical: kSizeXS,
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
