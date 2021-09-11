import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/constants.dart';

class EntityCardStatus extends StatelessWidget {
  final String text;
  final Color color;

  const EntityCardStatus({
    Key? key,
    required this.text,
    required this.color,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: kSizeXXXS,
        ),
        borderRadius: kBorderRadiusL,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kSizeXS, horizontal: kSizeM),
        child: Text(text, style: Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: kSizeS * (11 / 16),
        ),),
      ),
    );
  }
}