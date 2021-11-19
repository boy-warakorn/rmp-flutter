import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/screens/general/view_attachment_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

enum ImgSourceType {
  url,
  filePath,
}

class AttachmentList extends StatelessWidget {
  const AttachmentList({
    Key? key,
    this.imgSourceStrings = const [],
    required this.imgSourceType,
  }) : super(key: key);

  final List<String> imgSourceStrings;
  final ImgSourceType imgSourceType;

  Widget _buildAttachmentCard(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ViewAttactmentScreen.routeName, arguments: {
          "src": imgSourceStrings[index],
          "srcType": imgSourceType == ImgSourceType.filePath ? "filePath" : "url",
        });
      },
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
    for (int i = 0; i < imgSourceStrings.length; i++) {
      colContent.add(_buildAttachmentCard(i, context));
    }

    return Column(
      children: colContent,
    );
  }
}
