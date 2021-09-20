import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/auth_provider.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/repositories/auth_repository.dart';
import 'package:rmp_flutter/screens/condos/forgot_password_screen.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field_icon.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';

class LoginScreen extends HookConsumerWidget {
  static const routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _username = useTextEditingController();
    final _password = useTextEditingController();
    final _isLoading = useState(false);

    final _authRepository = ref.read(authRepositoryProvider);
    final _curUser = ref.read(currentUser);

    void _onLogin() async {
      if (_username.text.isEmpty || _password.text.isEmpty) {
        return;
      }
      final _authDto = AuthDto(
        username: _username.text.trim(),
        password: _password.text.trim(),
      );
      try {
        _isLoading.value = true;
        await _authRepository.login(_authDto);
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Error"),
            content: Text(
              e.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        );
      }
      _isLoading.value = false;
      await _curUser.getCurrentUser();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(PreLoadingScreen.routeName, (_) => false);
    }

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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(
                    kSizeM,
                  ),
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
                    margin: const EdgeInsets.symmetric(
                      horizontal: kSizeM * 1.4,
                    ),
                    decoration: const BoxDecoration(
                      color: kBrandColor,
                      borderRadius: kBorderRadiusM,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kSizeM,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kSizedBoxVerticalM,
                  FormTextFieldIcon(
                    fieldName: "Username",
                    icon: const Icon(
                      Icons.account_circle,
                      size: kSizeM,
                    ),
                    textEditingController: _username,
                    suffixText: '',
                    isPassword: false,
                  ),
                  kSizedBoxVerticalS,
                  FormTextFieldIcon(
                    fieldName: "Password",
                    icon: const Icon(
                      Icons.lock_rounded,
                      size: kSizeM,
                    ),
                    textEditingController: _password,
                    suffixText: 'Show',
                    isPassword: true,
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
                  CustomButton(
                    padding: EdgeInsets.symmetric(
                      vertical: _isLoading.value ? kSizeS * 0.8 : kSizeS * 1.2,
                    ),
                    text: "LOGIN",
                    isLoading: _isLoading.value,
                    onPressed: _onLogin,
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
