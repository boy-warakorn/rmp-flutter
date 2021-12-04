import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/dialogs/notice_dialog.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isGradient;
  final bool isEdit;
  final bool isResident;

  @override
  Size get preferredSize => const Size.fromHeight(kSizeM * 1.75);
  const BackAppBar({
    Key? key,
    this.isGradient = false,
    this.isEdit = false,
    this.isResident = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBgColor,
      elevation: 0,
      flexibleSpace: isGradient
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    kBrandColor,
                    kBrandAlternativeDarkerColor,
                  ],
                ),
              ),
            )
          : Container(),
      actions: [
        isEdit
            ? Container(
                margin: EdgeInsets.only(
                  right: kSizeXXS,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.mode_edit,
                    size: kSizeS * 1.4,
                  ),
                  onPressed: () {
                    isResident
                        ? showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return NoticeDialog(
                                description:
                                    "In order to change your name or your phone number. You must contact to condo's personnel to ask for permission.",
                                iconColor: kErrorColor,
                              );
                            },
                          )
                        : showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return NoticeDialog(
                                description:
                                    "In order to change your name or your phone number. You must change them on our web page.",
                              );
                            },
                          );
                  },
                ),
              )
            : Container()
      ],
      leading: IconButton(
        splashRadius: kSizeS,
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          size: kSizeS * 1.25,
          color: isGradient ? kLightColor : kBlackColor,
        ),
      ),
    );
  }
}
