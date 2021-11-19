import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field_icon.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ProfileSettingScreen extends HookConsumerWidget {
  static const routeName = "/profile";
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _role = ref.read(currentUser).user.role;
    final _name = ref.read(currentUser).user.name;
    final _phoneNumber = ref.read(currentUser).user.phoneNumber;
    final _nameController = useTextEditingController(text: _name);
    final _phoneNumberController = useTextEditingController(text: _phoneNumber);
    final _roleController = useTextEditingController(text: _role);

    return Scaffold(
      appBar: BackAppBar(
        isGradient: true,
        isEdit : true,
      ),
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                kSizedBoxVerticalS,
                Image.asset(
                  "assets/images/man-avatar.png",
                  width: 250,
                  height: 250,
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
                        fieldName: "Your name",
                        textEditingController: _nameController,
                        fieldColor: kBrandDarkerColor,
                      ),
                      kSizedBoxVerticalXS,
                      kSizedBoxVerticalS,
                      FormTextFieldIcon(
                        fieldName: "Phone number",
                        textEditingController: _phoneNumberController,
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
                    ],
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
