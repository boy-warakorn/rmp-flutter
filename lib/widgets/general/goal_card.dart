import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class GoalCard extends StatelessWidget {
  final String title;
  final String content;
  final Icon icon;

  const GoalCard({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   child: Padding(
    //     padding: EdgeInsets.all(kSizeS),
    //     child: Column(
    //       children: [
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Text(
    //               title,
    //               style: Theme.of(context).textTheme.headline4,
    //             ),
    //             kSizedBoxHorizontalXS,
    //             icon,
    //           ],
    //         ),
    //         kSizedBoxVerticalXS,
    //         Text(
    //           content,
    //           style: Theme.of(context).textTheme.bodyText1?.copyWith(
    //                 fontSize: kSizeS * (10 / 8),
    //               ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return CardTemplate(
      // padding: EdgeInsets.all(kSizeXS),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
              kSizedBoxHorizontalXS,
              icon,
            ],
          ),
          kSizedBoxVerticalXS,
          Text(
            content,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: kSizeS * (0.8),
                ),
          ),
        ],
      ),
    );
  }
}
