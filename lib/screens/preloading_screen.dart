import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/screens/login_screen.dart';
import 'package:rmp_flutter/screens/main_screen.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';

class PreLoadingScreen extends HookConsumerWidget {
  static const routeName = "/preloading";
  const PreLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _curUser = ref.watch(currentUser);

    useEffect(() {
      if (_curUser.user.userId.isEmpty) {
        _curUser.getCurrentUser();
      }
    }, []);

    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
        future: Future.wait([_initialization]),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Text('Error'),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
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

          return Scaffold(
            body: CenteredProgressIndicator(),
          );
        });
  }
}
