import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final bool isResident;
  final Function(int) onTap;

  const BottomBar({
    Key? key,
    required this.currentIndex,
    required this.isResident,
    required this.onTap,
  }) : super(key: key);

  final List<BottomNavigationBarItem> residentBottomNavigationBarItem =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: kSizeM,
      ),
      label: 'HOME',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.credit_card,
        size: kSizeM,
      ),
      label: 'PAYMENT',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.layers,
        size: kSizeM,
      ),
      label: 'POSTAL',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.chat_bubble_outline_rounded,
        size: kSizeM,
      ),
      label: 'HELPDESK',
    ),
  ];

  // Personnel BottomNavigationBarItem
  final List<BottomNavigationBarItem> personnelBottomNavigationBarItem =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: kSizeM,
      ),
      label: 'HOME',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.chat_bubble_outline_rounded,
        size: kSizeM,
      ),
      label: 'HELPDESK',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.layers,
        size: kSizeM,
      ),
      label: 'POSTAL',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kBrandColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      unselectedItemColor: kLightColor,
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: kFontSizeSubtitle1,
      ),
      selectedItemColor: kBlackColor,
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: kFontSizeSubtitle1,
      ),
      items: isResident
          ? residentBottomNavigationBarItem
          : personnelBottomNavigationBarItem,
    );
  }
}
