import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class CustomSlider extends StatelessWidget {
  final bool isResponded;
  final void Function(dynamic) onValueChanged;

  const CustomSlider({
    Key? key,
    required this.isResponded,
    required this.onValueChanged,
  }) : super(key: key);

  Widget _buildSelectionItem(
    BuildContext context, {
    required String text,
    required bool isSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kSizeXS,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5?.copyWith(
              fontSize: kFontSizeBody1,
              color: isSelected ? kStrokeColor : kSubtitleColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      children: {
        true: _buildSelectionItem(
          context,
          text: "Responded",
          isSelected: isResponded,
        ),
        false: _buildSelectionItem(
          context,
          text: "Response Required",
          isSelected: !isResponded,
        ),
      },
      groupValue: isResponded,
      onValueChanged: onValueChanged,
    );
  }
}
