import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  const BackAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kLightColor,
      elevation: 0,
      leading: Container(
        child: IconButton(
          onPressed: () => {print('Test')},
          icon: Icon(
            Icons.arrow_back_ios,
            size: kSizeS,
            color: kBlackColor,
          ),
        ),
      ),
    );
  }
}
