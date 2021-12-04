import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/repositories/user_repository.dart';
import 'package:rmp_flutter/screens/profile/change_password_result_screen.dart';
import 'package:rmp_flutter/widgets/dialogs/notice_dialog.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field_icon.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ChangePasswordScreen extends HookConsumerWidget {
  static const routeName = "/change-password";
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentPassword = useTextEditingController();
    final _newPassword = useTextEditingController();
    final _confirmPassword = useTextEditingController();
    final _isLoading = useState(false);

    Future<void> changePassword() async {
      if (_currentPassword.text.isEmpty &&
          _newPassword.text.isEmpty &&
          _confirmPassword.text.isEmpty) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return NoticeDialog(
              description: "Please inform your password.",
            );
          },
        );
      } else if (_newPassword.text != _confirmPassword.text) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return NoticeDialog(
              description:
                  "Your new password is not the same as your confirmed password",
            );
          },
        );
      } else {
        try {
          _isLoading.value = true;
          await UserRepository().changePassword(
            ChangePasswordDto(
              currentPassword: _currentPassword.text,
              newPassword: _newPassword.text,
            ),
          );
          _isLoading.value = false;
          Navigator.of(context).pushNamedAndRemoveUntil(
              ChangePasswordResultScreen.routeName, (_) => false);
        } catch (_) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return NoticeDialog(
                description:
                    "Your current password is not match with the one in our system.",
              );
            },
          );
          _isLoading.value = false;
        }
      }
    }

    return Scaffold(
      appBar: BackAppBar(
        isGradient: true,
        isEdit: false,
      ),
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: _isLoading.value
            ? Center(
                child: Column(
                  children: [
                    kSizedBoxVerticalXXL,
                    CircularProgressIndicator(),
                  ],
                ),
              )
            : Column(
                children: [
                  Column(
                    children: [
                      kSizedBoxVerticalL,
                      Icon(
                        Icons.lock_open_rounded,
                        size: kSizeXL,
                        color: kBrandColor,
                      ),
                      kSizedBoxVerticalM,
                      Text(
                        "Create new password to your account",
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              color: kBrandDarkerColor,
                            ),
                      ),
                      kSizedBoxVerticalL,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: kSizeS * 1.5),
                        child: Column(
                          children: [
                            FormTextFieldIcon(
                              fieldName: "Your current password",
                              textEditingController: _currentPassword,
                              fieldColor: kBrandDarkerColor,
                              isPassword: true,
                              suffixText: 'Show',
                            ),
                            kSizedBoxVerticalXS,
                            kSizedBoxVerticalS,
                            FormTextFieldIcon(
                              fieldName: "New password",
                              textEditingController: _newPassword,
                              fieldColor: kBrandDarkerColor,
                              isPassword: true,
                              suffixText: 'Show',
                            ),
                            kSizedBoxVerticalXS,
                            kSizedBoxVerticalS,
                            FormTextFieldIcon(
                              fieldName: "Confirm your new password",
                              textEditingController: _confirmPassword,
                              fieldColor: kBrandDarkerColor,
                              isPassword: true,
                              suffixText: 'Show',
                            ),
                            kSizedBoxVerticalL,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButton(
                                  padding: EdgeInsets.symmetric(
                                    vertical: kSizeXS,
                                    horizontal: kSizeM,
                                  ),
                                  text: "SUBMIT",
                                  onPressed: () {
                                    changePassword();
                                  },
                                ),
                              ],
                            )
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
