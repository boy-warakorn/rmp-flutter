import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/enums/image_source_type.dart';
import 'package:rmp_flutter/screens/general/view_attachment_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

const _iconSize = kSizeM;

class AttachmentList extends StatelessWidget {
  const AttachmentList({
    Key? key,
    this.imgSourceStrings = const [],
    required this.imgSourceType,
    this.removable = false,
    this.onRemove,
  }) : super(key: key);

  final List<String> imgSourceStrings;
  final ImageSourceType imgSourceType;
  final bool removable;
  final void Function(int)? onRemove;

  Widget _buildAttachmentCard(int index, BuildContext context) {
    void toAttachmentViewer() {
      Navigator.of(context)
          .pushNamed(ViewAttactmentScreen.routeName, arguments: {
        "src": imgSourceStrings[index],
        "srcType": imgSourceType,
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSizeXXXS),
      child: CardTemplate(
        padding: EdgeInsets.all(kSizeXS),
        child: Row(
          children: [
            Icon(
              Icons.image,
              color: kAlternativeColor,
              size: _iconSize,
            ),
            kSizedBoxHorizontalXS,
            CustomText(
              // "Attachment ${index + 1}",
              "Image",
            ),
            Spacer(),
            GestureDetector(
              onTap: toAttachmentViewer,
              child: Icon(
                Icons.visibility,
                color: kAlternativeColor,
                size: _iconSize,
              ),
            ),
            if (removable)
              SizedBox(
                width: kSizeS + kSizeXS,
              ),
            if (removable)
              GestureDetector(
                onTap: onRemove == null ? null : () => onRemove!(index),
                child: Icon(
                  Icons.close,
                  color: kAlternativeColor,
                  size: _iconSize * 0.75,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> colContent = [];
    for (int i = 0; i < imgSourceStrings.length; i++) {
      colContent.add(_buildAttachmentCard(i, context));
    }

    return Column(
      children: colContent,
    );
  }
}
