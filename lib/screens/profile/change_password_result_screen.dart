import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';

class ChangePasswordResultScreen extends StatelessWidget {
  static const routeName = "/change-password-result";
  const ChangePasswordResultScreen({Key? key}) : super(key: key);

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
              'Change Password Success!',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: kBlackColor,
                  ),
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
