import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class MainContentContainer extends StatelessWidget {
  final Color? color;
  final double topBorderRadius;
  final EdgeInsets padding;
  final Widget? child;

  const MainContentContainer({
    Key? key,
    this.color = kLightColor,
    this.topBorderRadius = kSizeS,
    this.padding = const EdgeInsets.all(
      kSizeS * (20 / 16),
    ),
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topBorderRadius),
          topRight: Radius.circular(topBorderRadius),
        ),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
