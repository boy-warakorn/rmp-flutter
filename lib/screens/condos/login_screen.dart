import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/condos/forgot_password_screen.dart';
import 'package:rmp_flutter/screens/main_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field_icon.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';

class LoginScreen extends HookWidget {
  static const routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _username = useTextEditingController();
    final _password = useTextEditingController();

    return Scaffold(
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: kSizeXXL * 1.1,
              decoration: BoxDecoration(
                color: kLightColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
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
                      1.0,
                      0.0,
                    ),
                    height: kSizeXXS,
                    margin: EdgeInsets.symmetric(
                      horizontal: kSizeM * 1.4,
                    ),
                    decoration: BoxDecoration(
                      color: kBrandColor,
                      borderRadius: kBorderRadiusM,
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
                      isPassword: false,
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
                      suffixText: 'Show',
                      isPassword: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ForgotPasswordScreen.routeName);
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
                      padding: EdgeInsets.symmetric(
                        vertical: kSizeS * 1.2,
                      ),
                      text: "LOGIN",
                      onPressed: () =>
                          Navigator.of(context).pushNamed(MainScreen.routeName),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
