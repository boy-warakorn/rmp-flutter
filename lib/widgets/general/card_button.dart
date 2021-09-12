import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CardButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final IconData icon;

  const CardButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: kBorderRadiusXS,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[kBrandColor, kBrandAlternativeDarkerColor],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: kBgColor,
          child: Padding(
            padding: const EdgeInsets.all(
              kSizeM * (36 / 32),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: kLightColor,
                  size: kFontSizeBody1 * (40 / 14),
                ),
                const SizedBox(
                  height: kSizeS * (20 / 16),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: kLightColor,
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
