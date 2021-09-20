import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  TextStyle? style;

  CustomText({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  CustomText.sectionHeader({
    Key? key,
    required String text,
    required BuildContext context,
  }) : this(
          key: key,
          text: text,
          style: Theme.of(context).textTheme.headline3,
        );

  @override
  Widget build(BuildContext context) {
    style ??= Theme.of(context).textTheme.bodyText1;

    return Text(
      text,
      style: style,
    );
  }
}
