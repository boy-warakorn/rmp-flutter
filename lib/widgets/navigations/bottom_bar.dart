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

  @override
  Widget build(BuildContext context) {

    final List<BottomNavigationBarItem> residentBottomNavigationBarItem =
    <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: kSizeS * 1.5,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.credit_card,
          size: kSizeS * 1.5,
        ),
        label: 'Payment',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.layers,
          size: kSizeS * 1.5,
        ),
        label: 'Postal',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.chat_bubble_outline_rounded,
          size: kSizeS * 1.5,
        ),
        label: 'Helpdesk',
      ),
    ];

    // Personnel BottomNavigationBarItem
    final List<BottomNavigationBarItem> personnelBottomNavigationBarItem =
    <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: kSizeS * 1.5,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.chat_bubble_outline_rounded,
          size: kSizeS * 1.5,
        ),
        label: 'Helpdesk',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.layers,
          size: kSizeS * 1.5,
        ),
        label: 'Postal',
      ),
    ];


    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(kSizeXS),
      ),
      child: BottomNavigationBar(
        backgroundColor: kBrandColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        unselectedItemColor: Colors.grey[300]?.withOpacity(0.7),
        unselectedLabelStyle: GoogleFonts.montserrat(
          fontSize: kFontSizeSubtitle1,
        ),
        selectedItemColor: kLightColor,
        selectedLabelStyle: GoogleFonts.montserrat(
          fontSize: kFontSizeSubtitle1,
        ),
        items: isResident
            ? residentBottomNavigationBarItem
            : personnelBottomNavigationBarItem,
      ),
    );
  }
}
