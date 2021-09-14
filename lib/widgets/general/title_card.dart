import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class TitleCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final int count;

  // upcoming params
  final String? subtitle;

  const TitleCard({
    Key? key,
    this.icon = const Icon(
      null,
      size: 0,
    ),
    required this.title,
    @Deprecated('Use [subtitle] instead') this.count = 0,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      child: Column(
        children: [
          if (icon.icon != null)
            Column(
              children: [
                icon,
                kSizedBoxVerticalXS,
              ],
            ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          icon.icon == null ? kSizedBoxVerticalS : kSizedBoxVerticalXS,
          Text(
            subtitle != null ? "$subtitle" : "$count",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          )
        ],
      ),
    );
  }
}
