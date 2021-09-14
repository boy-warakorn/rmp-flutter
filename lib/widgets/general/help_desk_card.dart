import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class HelpDeskCard extends StatelessWidget {
  final String title;
  final String date;
  final String detail;
  final Widget actionButton;

  const HelpDeskCard({
    Key? key,
    required this.title,
    required this.date,
    required this.detail,
    required this.actionButton,
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
                      "Owner: $title",
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
                      detail,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          kSizedBoxVerticalXS,
          Row(
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Container(width: kSizeXL, child: actionButton),
            ],
          ),
        ],
      ),
    );
  }
}
