import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final void Function() onPressed;
  final Color color;
  final EdgeInsets padding;
  final bool enabled;
  final bool isDominant;

  const CustomButton({
    Key? key,
    required this.text,
    this.textStyle,
    required this.onPressed,
    this.isDominant = true,
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
        primary: isDominant ? color : kLightColor,
        padding: padding,
        side: BorderSide(
          width: isDominant && !enabled ? 0 : kSizeXXXS * 0.5,
          color: color,
        ),
        shape: const RoundedRectangleBorder(borderRadius: kBorderRadiusXXL),
      ),
      onPressed: enabled ? onPressed : null,
      child: Center(
        child: Text(
          text,
          style: isDominant
              ? textStyle ??
                  Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.white,
                      )
              : Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: color,
                  ),
        ),
      ),
    );
  }
}
