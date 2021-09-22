import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CircleIconButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final bool isDominant;
  final Color color;
  final double size;

  const CircleIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.isDominant = false,
    this.color = kBlackColor,
    this.size = kSizeM + kSizeS + kSizeXS,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isDominant ? color : kLightColor;
    final Color contentColor = isDominant ? kLightColor : color;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: isDominant
              ? null
              : Border.all(
                  color: contentColor,
                ),
          boxShadow: [
            BoxShadow(
              color: kAlternativeColor,
              offset: Offset(
                0,
                kSizeXXXS,
              ),
              blurRadius: kSizeXXS,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: contentColor,
        ),
      ),
    );

    // return FloatingActionButton(
    //   onPressed: onPressed,
    //   backgroundColor: bgColor,
    //   child: Icon(
    //     icon,
    //     color: contentColor,
    //   ),
    //   shape: isDominant
    //       ? null
    //       : CircleBorder(
    //           side: BorderSide(
    //             color: contentColor,
    //             width: kSizeXXXS,
    //           ),
    //         ),
    // );
  }
}
