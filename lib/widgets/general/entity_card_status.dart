import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class EntityCardStatus extends StatelessWidget {
  final String text;
  final Color color;

  const EntityCardStatus({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  const EntityCardStatus.delivered({Key? key})
      : this(
          key: key,
          text: "Delivered",
          color: kSuccessColor,
        );

  const EntityCardStatus.inStorage({Key? key})
      : this(
          key: key,
          text: "In storage",
          color: kWarningColor,
        );

  const EntityCardStatus.pending({Key? key})
      : this(
          key: key,
          text: "Pending",
          color: kWarningColor,
        );

  const EntityCardStatus.resolved({Key? key})
      : this(
          key: key,
          text: "Resolved",
          color: kSuccessColor,
        );

  const EntityCardStatus.responded({Key? key})
      : this(
          key: key,
          text: "Responded",
          color: kStrokeColor,
        );

  const EntityCardStatus.unknown({Key? key})
      : this(
          key: key,
          text: "Unknown",
          color: kBlackColor,
        );

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
        padding:
            const EdgeInsets.symmetric(vertical: kSizeXS, horizontal: kSizeM),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: kSizeS * 0.85,
              ),
        ),
      ),
    );
  }
}
