import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class TextWallDisplay extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  TextStyle? style;

  TextWallDisplay({
    Key? key,
    this.text = "",
    this.padding = const EdgeInsets.all(kSizeS),
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    style ??= Theme.of(context).textTheme.bodyText1;
    return Container(
      padding: padding,
      color: kLightColor,
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: style,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
