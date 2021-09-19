import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class HelpDeskCard extends StatelessWidget {
  final String owner;
  final String date;
  final String detail;
  final String title;
  final Widget? actionButton;

  const HelpDeskCard({
    Key? key,
    required this.owner,
    required this.title,
    required this.date,
    required this.detail,
    this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Owner: $owner",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: kFontSizeHeadline4,
                          ),
                    ),
                    kSizedBoxVerticalXS,
                    Text(
                      "Date: $date",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: kSubtitleColor,
                          ),
                    ),
                    kSizedBoxVerticalXS,
                    Text(
                      "Title: $title",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    kSizedBoxVerticalXS,
                    Text(
                      detail,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (actionButton != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: kSizeXL, child: actionButton),
              ],
            ),
        ],
      ),
    );
  }
}
