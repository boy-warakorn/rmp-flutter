import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final bool isResident;
  final Function(int) onTap;

  BottomBar({
    Key? key,
    required this.currentIndex,
    required this.isResident,
    required this.onTap,
  }) : super(key: key);

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
      icon: Stack(
        children: [
          Icon(
            Icons.credit_card,
            size: kSizeS * 1.5,
          ),
          Positioned(
            right: 0.0,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: kErrorColor,
                borderRadius: kBorderRadiusXS,
              ),
              constraints: BoxConstraints(
                minHeight: 12,
                minWidth: 12,
              ),
              child: Text(
                "0",
                style: TextStyle(
                  color: kLightColor,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
      label: 'Payment',
    ),
    BottomNavigationBarItem(
      icon: Stack(
        children: [
          Icon(
            Icons.layers,
            size: kSizeS * 1.5,
          ),
          Positioned(
            right: 0.0,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: kErrorColor,
                borderRadius: kBorderRadiusXS,
              ),
              constraints: BoxConstraints(
                minHeight: 12,
                minWidth: 12,
              ),
              child: Text(
                "4",
                style: TextStyle(
                  color: kLightColor,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
      label: 'Postal',
    ),
    BottomNavigationBarItem(
      icon: Stack(
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            size: kSizeS * 1.5,
          ),
          Positioned(
            right: 0.0,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: kErrorColor,
                borderRadius: kBorderRadiusXS,
              ),
              constraints: BoxConstraints(
                minHeight: 12,
                minWidth: 12,
              ),
              child: Text(
                "10",
                style: TextStyle(
                  color: kLightColor,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
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
      icon: Stack(
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            size: kSizeS * 1.5,
          ),
          Positioned(
            right: 0.0,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: kErrorColor,
                borderRadius: kBorderRadiusXS,
              ),
              constraints: BoxConstraints(
                minHeight: 12,
                minWidth: 12,
              ),
              child: Text(
                "0",
                style: TextStyle(
                  color: kLightColor,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
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
    BottomNavigationBarItem(
      label: 'Notifications',
      icon: Stack(
        children: [
          Icon(
            Icons.notifications,
            size: kSizeS * 1.5,
          ),
          Positioned(
            right: 0.0,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: kErrorColor,
                borderRadius: kBorderRadiusXS,
              ),
              constraints: BoxConstraints(
                minHeight: 12,
                minWidth: 12,
              ),
              child: Text(
                "0",
                style: TextStyle(
                  color: kLightColor,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
