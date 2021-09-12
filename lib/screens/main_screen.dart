import 'package:flutter/material.dart';
import 'package:rmp_flutter/screens/widget_preview_screen.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WidgetPreviewScreen();
  }
}
