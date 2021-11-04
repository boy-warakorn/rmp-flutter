import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class EntityCardStatus extends StatelessWidget {
  final String text;
  final Color color;
  final bool isResident;

  const EntityCardStatus({
    Key? key,
    required this.text,
    required this.color,
    this.isResident = false,
  }) : super(key: key);

  const EntityCardStatus.received({Key? key})
      : this(
          key: key,
          text: "Received",
          color: kSuccessColor,
          isResident: true,
        );

  const EntityCardStatus.inStorage({Key? key})
      : this(
          key: key,
          text: "In storage",
          color: kWarningColor,
          isResident: true,
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
        padding: EdgeInsets.symmetric(
          vertical: isResident ? kSizeXXS : kSizeXS,
          horizontal: isResident ? kSizeS : kSizeM,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: isResident ? kFontSizeBody2 : kSizeS * 0.85,
              ),
        ),
      ),
    );
  }
}
