import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class TitleCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final int count;

  const TitleCard({
    Key? key,
    this.icon = const Icon(
      null,
      size: 0,
    ),
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   child: Padding(
    //     padding: const EdgeInsets.all(kSizeS),
    //     child: Column(
    //       children: [
    //         if (icon.icon != null)
    //           Column(
    //             children: [
    //               icon,
    //               kSizedBoxVerticalXS,
    //             ],
    //           ),
    //         Text(
    //           title,
    //           style: Theme.of(context).textTheme.headline4,
    //         ),
    //         icon.icon == null ? kSizedBoxVerticalS : kSizedBoxVerticalXS,
    //         Text(
    //           "$count",
    //           style: Theme.of(context)
    //               .textTheme
    //               .headline4
    //               ?.copyWith(fontWeight: FontWeight.normal),
    //         )
    //       ],
    //     ),
    //   ),
    // );
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
            "$count",
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
