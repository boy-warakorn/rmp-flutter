import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/routes.dart';
import 'package:rmp_flutter/configs/style.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RMP-flutter',
      theme: kRMPTheme,
      routes: routes,
      initialRoute: PreLoadingScreen.routeName,
    );
  }
}
