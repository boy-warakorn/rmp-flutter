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
        horizontal: kSizeS * 1.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: isBold
                ? Theme.of(context).textTheme.headline5?.copyWith(
              color: kBlackColor,
              fontWeight: FontWeight.normal,
            )
                : Theme.of(context).textTheme.headline3?.copyWith(
                      color: kBrandDarkerColor,
                      fontSize: kFontSizeHeadline3,
                    ),
          ),
        ],
      ),
    );
  }
}
