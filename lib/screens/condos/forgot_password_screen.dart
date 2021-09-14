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
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: kBlackColor,
                          size: kSizeS,
                        ),
                        kSizedBoxHorizontalXS,
                        Text(
                          "Back to log in",
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontSize: kFontSizeHeadline4,
                                  ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  kSizedBoxVerticalM,
                  Container(
                    child: FormTextFieldIcon(
                      fieldName: "Email",
                      icon: Icon(
                        Icons.email_outlined,
                        size: kSizeM,
                      ),
                      textEditingController: _username,
                      suffixText: '',
                      isPassword: false,
                    ),
                  ),
                  kSizedBoxVerticalM,
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: kSizeM * 1.25,
                    ),
                    child: CustomButton(
                      padding: EdgeInsets.symmetric(
                        vertical: kSizeS * 1.4,
                      ),
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
