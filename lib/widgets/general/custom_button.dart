import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final void Function() onPressed;
  final Color color;
  final EdgeInsets padding;

  const CustomButton({
    Key? key,
    required this.text,
    this.textStyle,
    required this.onPressed,
    this.color = kBrandColor,
    this.padding = const EdgeInsets.all(
      kSizeXXS,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: padding,
        shape: const RoundedRectangleBorder(borderRadius: kBorderRadiusXXL),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: textStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
