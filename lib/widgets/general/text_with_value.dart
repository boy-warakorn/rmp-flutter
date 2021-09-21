import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class TextWithValue extends StatelessWidget {
  final String head;
  final String detail;
  const TextWithValue({
    Key? key,
    required this.head,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          head,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                color: kBlackColor,
              ),
        ),
        kSizedBoxVerticalS,
        Container(
          width: MediaQuery.of(context).size.width,
          height: kSizeXXL,
          padding: EdgeInsets.all(kSizeS),
          decoration: BoxDecoration(
              borderRadius: kBorderRadiusS,
              color: kLightColor,
              border: Border.all(
                color: kInputBorderColor,
                width: kSizeXXXS / 2,
              )),
          child: Text(
            detail,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
