import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isGradient;
  @override
  Size get preferredSize => const Size.fromHeight(kSizeM * 1.75);
  const BackAppBar({
    Key? key,
    this.isGradient = false,
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
      leading: Container(
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: kSizeS * 1.25,
            color: isGradient ? kLightColor : kBlackColor,
          ),
        ),
      ),
    );
  }
}
