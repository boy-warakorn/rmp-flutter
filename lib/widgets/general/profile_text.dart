import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class ProfileText extends StatelessWidget {
  final String text;
  final bool isBold;
  const ProfileText({
    Key? key,
    required this.text,
    this.isBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kSizeL * 1.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: isBold
                ? Theme.of(context).textTheme.headline3?.copyWith(
                      color: kLightColor,
                    )
                : Theme.of(context).textTheme.headline5?.copyWith(
                      color: kLightColor,
                      fontSize: kFontSizeHeadline3,
                    ),
          ),
        ],
      ),
    );
  }
}
