import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/main_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field_icon.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/app_bar.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ProfileSettingScreen extends HookWidget {
  static const routeName = "/condo/profile";
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _username = useTextEditingController(text: "John Doe");
    final _gender = useTextEditingController(text: "Male");
    final _age = useTextEditingController(text: "20");
    final _role = useTextEditingController(text: "Condomiunium Manager");

    return Scaffold(
      appBar: BackAppBar(
        isGradient: true,
      ),
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    kBrandColor,
                    kBrandAlternativeDarkerColor,
                  ],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                    kSizeS,
                  ),
                ),
              ),
              child: kSizedBoxVerticalL,
            ),
            Transform.translate(
              offset: const Offset(0, -kSizeM * 1.5),
              child: Image.asset("assets/images/129.png"),
            ),
            Text(
              "Personal Profile",
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: kBrandDarkerColor,
                  ),
            ),
            kSizedBoxVerticalXS,
            kSizedBoxVerticalS,
            Container(
              padding: EdgeInsets.symmetric(horizontal: kSizeS * 1.5),
              child: Column(
                children: [
                  FormTextFieldIcon(
                    fieldName: "Username",
                    textEditingController: _username,
                    fieldColor: kBrandDarkerColor,
                  ),
                  kSizedBoxVerticalXS,
                  kSizedBoxVerticalS,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FormTextFieldIcon(
                          fieldName: "Gender",
                          textEditingController: _gender,
                          fieldColor: kBrandDarkerColor,
                        ),
                      ),
                      kSizedBoxHorizontalM,
                      Expanded(
                        child: FormTextFieldIcon(
                          fieldName: "Age",
                          textEditingController: _age,
                          fieldColor: kBrandDarkerColor,
                        ),
                      ),
                    ],
                  ),
                  kSizedBoxVerticalXS,
                  kSizedBoxVerticalS,
                  FormTextFieldIcon(
                    fieldName: "Your Role",
                    textEditingController: _role,
                    fieldColor: kBrandDarkerColor,
                  ),
                  kSizedBoxVerticalM,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: kSizeXL,
                        child: CustomButton(
                          text: "DONE",
                          onPressed: () => Navigator.of(context)
                              .pushNamed(MainScreen.routeName),
                        ),
                      ),
                    ],
                  ),
                  kSizedBoxVerticalM,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}