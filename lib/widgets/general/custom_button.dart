import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final void Function() onPressed;
  final Color color;
  final EdgeInsets padding;
  final bool isLoading;
  final bool enabled;

  const CustomButton({
    Key? key,
    required this.text,
    this.textStyle,
    required this.onPressed,

    @Deprecated("Use [enabled] to allow/disallow the button instead")
    this.isLoading = false,
    this.color = kBrandColor,
    this.padding = const EdgeInsets.all(
      kSizeXXS,
    ),
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: padding,
        shape: const RoundedRectangleBorder(borderRadius: kBorderRadiusXXL),
      ),
      onPressed: enabled
          ? isLoading
              ? () {}
              : onPressed
          : null,
      child: Center(
        child: isLoading
            ? CircularProgressIndicator(
                color: kLightColor,
              )
            : Text(
                text,
                style: textStyle ??
                    Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.white,
                        ),
              ),
      ),
    );
  }
}
