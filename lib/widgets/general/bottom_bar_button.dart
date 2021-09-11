import 'package:flutter/material.dart';

class BottomBarButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final void Function() onClick;
  const BottomBarButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
