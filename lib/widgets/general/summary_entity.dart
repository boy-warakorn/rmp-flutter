import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class SummaryEntity extends StatelessWidget {
  final String text;
  final int count;

  const SummaryEntity({
    Key? key,
    required this.text,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Container(
              width: kSizeM * (0.75),
              decoration: const BoxDecoration(
                color: kErrorColor,
                borderRadius: kBorderRadiusXS,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kSizeXXS),
                child: Center(
                  child: Text(
                    count > 9 ? "9+" : "$count",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: kFontSizeBody1,
                          color: kLightColor,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
        kSizedBoxVerticalXXS,
        const Divider(
          color: kSubtitleColor,
        ),
      ],
    );
  }
}
