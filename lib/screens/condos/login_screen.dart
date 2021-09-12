import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field_icon.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: kSizeXXL / 1.33,
            decoration: BoxDecoration(
              color: kLightColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(0),
                bottom: Radius.circular(kSizeM),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                kSizedBoxVerticalM,
                Image.asset(
                  "assets/images/rmp_ex.png",
                  width: kSizeXL,
                  height: kSizeXL,
                ),
                Text(
                  "Log in",
                  style: GoogleFonts.montserrat(
                    color: kBlackColor,
                    fontSize: kFontSizeHeadline3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(
                  color: kBrandColor,
                  thickness: kSizeXXS,
                  indent: kSizeM * 1.5,
                  endIndent: kSizeM * 1.5,
                ),
                kSizedBoxVerticalM,
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kSizeM * 1.27,
                  ),
                  child: FormTextFieldIcon(
                    fieldName: "Username",
                    icon: Icon(Icons.account_circle, size: kSizeM),
                    textEditingController: usernameController,
                    rightSideText: '',
                  ),
                ),
                kSizedBoxVerticalS,
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kSizeM * 1.27,
                  ),
                  child: FormTextFieldIcon(
                      fieldName: "Password",
                      icon: Icon(Icons.lock_rounded, size: kSizeM),
                      textEditingController: passwordController,
                      rightSideText: 'Show'),
                ),
                GestureDetector(
                  onTap: () {
                    print(
                        "Username: ${usernameController.text}, Password: ${passwordController.text}");
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: kSizeXL * 1.45),
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: kFontSizeHeadline4,
                          ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                kSizedBoxVerticalM,
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kSizeM * 1.27,
                  ),
                  child: CustomButton(
                    text: "LOGIN",
                    onPressed: () {
                      print('LOG IN');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
