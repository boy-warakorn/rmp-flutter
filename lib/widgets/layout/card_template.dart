import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CardTemplate extends StatelessWidget {
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color? color;
  final Widget child;

  const CardTemplate({
    Key? key,
    this.padding = const EdgeInsets.all(kSizeS),
    this.borderRadius = kBorderRadiusS,
    this.child = const SizedBox(),
    this.color,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}