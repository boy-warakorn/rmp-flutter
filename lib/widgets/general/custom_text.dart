import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CustomText(
    this.text, {
    this.style,
    Key? key,
  }) : super(key: key);

  CustomText.sectionHeader(
    String text,
    BuildContext context, {
    Key? key,
  }) : this(
          text,
          style: Theme.of(context).textTheme.headline3,
          key: key,
        );

  CustomText.sectionHeaderLight(
    String text,
    BuildContext context, {
    Key? key,
  }) : this(
          text,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                color: kLightColor,
              ),
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.bodyText1,
    );
  }
}
