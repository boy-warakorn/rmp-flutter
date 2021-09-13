import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class TeamMemberCard extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final String role;

  const TeamMemberCard({
    Key? key,
    required this.name,
    required this.role,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailStyle = Theme.of(context).textTheme.headline5?.copyWith(
          fontSize: kFontSizeBody2 * (11 / 12),
        );
    return Container(
      width: kSizeXL * (200 / 128),
      decoration: const BoxDecoration(
        color: kBrandLighterColor,
        borderRadius: kBorderRadiusS,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kSizeS * (20 / 16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: kSizeM,
              backgroundImage: image,
            ),
            kSizedBoxVerticalXS,
            Text(
              name,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: kFontSizeBody2,
                  ),
            ),
            kSizedBoxVerticalXS,
            Text(
              role,
              style: detailStyle,
            ),
            kSizedBoxVerticalXS,
            Text(
              "KMUTT",
              style: detailStyle,
            ),
          ],
        ),
      ),
    );
  }
}
