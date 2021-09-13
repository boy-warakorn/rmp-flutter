import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Icon icon;

  const DrawerButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      onTap: onPressed,
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
