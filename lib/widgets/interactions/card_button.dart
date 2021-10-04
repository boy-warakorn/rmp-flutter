import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CardButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final IconData icon;

  /// [useGradientBackground] must be false for this to activate
  final Color backgroundColor;
  final bool useGradientBackground;
  final Color contentColor;

  const CardButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.useGradientBackground = true,
    this.backgroundColor = kBrandColor,
    this.contentColor = kLightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadiusXS,
        color: backgroundColor,
        gradient: useGradientBackground
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[kBrandColor, kBrandAlternativeDarkerColor],
              )
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: kBgColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kSizeM * (36 / 32),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: contentColor,
                  size: kFontSizeBody1 * (40 / 14),
                ),
                const SizedBox(
                  height: kSizeS * (20 / 16),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: contentColor,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
