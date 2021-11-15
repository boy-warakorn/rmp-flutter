import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class NoticeDialog extends StatelessWidget {
  final IconData icon;
  final String description;
  final String dismissLabel;
  final Color iconColor;

  const NoticeDialog({
    Key? key,
    this.icon = Icons.info,
    this.description = "",
    this.dismissLabel = "OK",
    this.iconColor = kBlackColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(kSizeS),
      content: Container(
        color: kLightColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: kSizeL,
            ),
            kSizedBoxVerticalS,
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            kSizedBoxVerticalS,
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                dismissLabel,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: kBrandColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
