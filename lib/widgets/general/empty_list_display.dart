import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class EmptyListDisplay extends StatelessWidget {
  final String text;
  final IconData icon;

  const EmptyListDisplay({
    Key? key,
    this.text = "No item to display",
    this.icon = Icons.no_sim_outlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: kAlternativeColor,
            size: kSizeL,
          ),
          kSizedBoxVerticalS,
          Text(
            text,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: kAlternativeColor,
                  fontSize: kSizeS * (1.5),
                ),
          ),
        ],
      ),
    );
  }
}
