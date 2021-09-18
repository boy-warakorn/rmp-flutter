import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;
  final EdgeInsets padding;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
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
      onPressed: isLoading ? () {} : onPressed,
      child: Center(
        child: isLoading
            ? CircularProgressIndicator(
                color: kLightColor,
              )
            : Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
