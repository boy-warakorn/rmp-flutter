import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class AttachmentList extends StatelessWidget {
  const AttachmentList({
    Key? key,
    this.imgUrlList = const [],
    this.onSelect,
  }) : super(key: key);

  final List<String> imgUrlList;
  final void Function(int)? onSelect;

  Widget _buildAttachmentCard(int index) {
    return GestureDetector(
      onTap: onSelect == null ? null : () => onSelect!(index),
      child: CardTemplate(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.image,
              color: kAlternativeColor,
            ),
            CustomText(
              "Attachment ${index + 1}",
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> colContent = [];
    for (int i = 0; i < imgUrlList.length; i++) {
      colContent.add(_buildAttachmentCard(i));
    }

    return Column(
      children: colContent,
    );
  }
}
