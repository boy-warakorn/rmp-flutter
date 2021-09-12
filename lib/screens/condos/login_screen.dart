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
    final _username = useTextEditingController();
    final _password = useTextEditingController();

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: kSizeXXL * 1.1,
            decoration: BoxDecoration(
              color: kLightColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(kSizeM),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    kSizedBoxVerticalL,
                    Image.asset(
                      "assets/images/rmp_ex.png",
                      width: kSizeXL,
                      height: kSizeXL,
                    ),
                    kSizedBoxVerticalM,
                    kSizedBoxVerticalS,
                    Text(
                      "Login",
                      style: GoogleFonts.montserrat(
                        color: kBlackColor,
                        fontSize: kFontSizeHeadline3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(
                    0.0,
                    10.0,
                    0.0,
                  ),
                  child: Divider(
                    color: kBrandColor,
                    thickness: kSizeXXS,
                    indent: kSizeM * 1.5,
                    endIndent: kSizeM * 1.5,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kSizeM,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kSizedBoxVerticalM,
                Container(
                  child: FormTextFieldIcon(
                    fieldName: "Username",
                    icon: Icon(
                      Icons.account_circle,
                      size: kSizeM,
                    ),
                    textEditingController: _username,
                    suffixText: '',
                  ),
                ),
                kSizedBoxVerticalS,
                Container(
                  child: FormTextFieldIcon(
                      fieldName: "Password",
                      icon: Icon(
                        Icons.lock_rounded,
                        size: kSizeM,
                      ),
                      textEditingController: _password,
                      suffixText: 'Show'),
                ),
                GestureDetector(
                  onTap: () {
                    print(
                        "Username: ${_username.text}, Password: ${_password.text}");
                  },
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: kFontSizeHeadline4,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
                kSizedBoxVerticalM,
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kSizeM * 1.25,
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
