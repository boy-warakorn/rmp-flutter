import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Welcome",
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
