import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const AnnouncementCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kInputBorderColor,
            spreadRadius: 3,
            blurRadius: kSizeS,
          ),
        ],
      ),
      child: CardTemplate(
        borderRadius: kBorderRadiusXS,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
            kSizedBoxVerticalXS,
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
