// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool haveFilter;

  @override
  Size get preferredSize => const Size.fromHeight(kSizeM * 1.75);

  const MainAppBar({
    Key? key,
    required this.haveFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
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
      ),
      actions: [
        haveFilter
            ? Container(
                margin: EdgeInsets.only(right: kSizeS),
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.slidersH,
                    size: kSizeS * 1.1,
                  ),
                  onPressed: () {
                    print('this is filter function.');
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}
