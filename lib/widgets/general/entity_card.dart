import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class EntityCard extends StatelessWidget {
  final String title;
  final String date;
  final Widget entityStatus;
  final void Function() onPressed;

  const EntityCard({
    Key? key,
    required this.title,
    required this.date,
    required this.entityStatus,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CardTemplate(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
            kSizedBoxVerticalXS,
            Text(
              date,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: kSubtitleColor,
                  ),
            ),
            kSizedBoxVerticalS,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                entityStatus,
              ],
            ),
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
