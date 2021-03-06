import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field_icon.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ProfileSettingScreen extends HookConsumerWidget {
  static const routeName = "/profile";
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _role = ref.read(currentUser).user.role;
    final _name = ref.read(currentUser).user.name;
    final _nameController = useTextEditingController(text: _name);
    final _phoneNumber = useTextEditingController(
        text: "0933264415"); //TODO: will add phone number data
    final _roleController = useTextEditingController(text: _role);

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
              offset: const Offset(0, -kSizeM * 1.8),
              child: Column(
                children: [
                  Image.asset("assets/images/129.png"),
                  kSizedBoxVerticalS,
                  kSizedBoxVerticalXS,
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
                          fieldName: "Your name",
                          textEditingController: _nameController,
                          fieldColor: kBrandDarkerColor,
                        ),
                        kSizedBoxVerticalXS,
                        kSizedBoxVerticalS,
                        FormTextFieldIcon(
                          fieldName: "Phone number",
                          textEditingController: _phoneNumber,
                          fieldColor: kBrandDarkerColor,
                        ),
                        kSizedBoxVerticalXS,
                        kSizedBoxVerticalS,
                        FormTextFieldIcon(
                          fieldName: "Your Role",
                          textEditingController: _roleController,
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
                                    .pushNamed(PreLoadingScreen.routeName),
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
          ],
        ),
      ),
    );
  }
}
