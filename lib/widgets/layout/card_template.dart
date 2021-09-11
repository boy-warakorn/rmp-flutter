import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CardTemplate extends StatelessWidget {
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Widget child;

  const CardTemplate({
    Key? key,
    this.padding = const EdgeInsets.all(kSizeS),
    this.borderRadius = kBorderRadiusS,
    this.child = const SizedBox(),
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
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