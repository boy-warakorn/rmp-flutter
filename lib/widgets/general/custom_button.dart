import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  final Color color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onClick,
    this.color = kBrandColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(kSizeS),
        shape: RoundedRectangleBorder(
          borderRadius: kBorderRadiusXXL
        ),
      ),
      onPressed: onClick,
      child: Center(
        child: Text(text, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),),
      )
    );
  }
}