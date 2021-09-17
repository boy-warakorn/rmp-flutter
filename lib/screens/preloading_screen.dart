import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/screens/login_screen.dart';
import 'package:rmp_flutter/screens/main_screen.dart';

class PreLoadingScreen extends HookConsumerWidget {
  static const routeName = "/preloading";
  const PreLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _curUser = ref.watch(currentUser);

    if (_curUser.user.userId.isEmpty) {
      _curUser.getCurrentUser();
    }

    return _curUser.user.userId.isEmpty
        ? _curUser.isLoading
            ? Scaffold(
                backgroundColor: kBgColor,
                body: Center(
                  child: Image.asset(
                    "assets/images/rmp_ex.png",
                    width: kSizeXL,
                    height: kSizeXL,
                  ),
                ),
              )
            : const LoginScreen()
        : const MainScreen();
  }
}
