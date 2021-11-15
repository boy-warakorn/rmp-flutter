import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/configs/entity_status.dart';
import 'package:rmp_flutter/widgets/general/entity_card_status.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class EntityCard extends StatelessWidget {
  final String title;
  final String date;
  final Widget? entityStatus;
  final void Function() onPressed;

  // upcoming
  final String? statusKey;
  final String? subtitle;
  final String imageUrl;
  final bool isPostal;

  const EntityCard({
    Key? key,
    required this.title,
    @Deprecated("Use [subtitle] instead") this.date = "-",
    @Deprecated("Use [statusKey] with keys in entity_status.dart instead")
        this.entityStatus,
    required this.onPressed,
    this.statusKey,
    this.subtitle,
    this.imageUrl = "",
    this.isPostal = false,
  }) : super(key: key);

  Widget _buildStatusDisplay() {
    if (statusKey != null) {
      return entityStatusPresets[statusKey] ?? EntityCardStatus.unknown();
    } else {
      return entityStatus ?? EntityCardStatus.unknown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CardTemplate(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isPostal
                ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kSizeS,
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          imageUrl,
                          width: 100,
                          height: 100,
                        ),
                        kSizedBoxVerticalXS,
                      ],
                    ),
                  )
                : Container(),
            Text(
              title,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: isPostal ? kFontSizeBody2 : kFontSizeHeadline4,
                  ),
            ),
            kSizedBoxVerticalXS,
            Text(
              subtitle ?? date,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: kSubtitleColor,
                    fontSize: isPostal ? kFontSizeBody2 : kFontSizeBody1,
                  ),
            ),
            kSizedBoxVerticalS,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildStatusDisplay(),
              ],
            ),
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
