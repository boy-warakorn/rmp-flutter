import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/condos/login_screen.dart';
import 'package:rmp_flutter/screens/main_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field_icon.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';

class ForgotPasswordScreen extends HookWidget {
  static const routeName = "/forgot-password";
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _username = useTextEditingController();

    return Scaffold(
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
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
                        "Password Recovery",
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
                      isPassword: false,
                    ),
                  ),
                  kSizedBoxVerticalS,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      "Back to log in",
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
                      text: "SUBMIT",
                      onPressed: () => Navigator.of(context)
                          .pushNamed(LoginScreen.routeName),
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
