import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kBrandColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      unselectedItemColor: kLightColor,
      unselectedLabelStyle: GoogleFonts.montserrat(
        color: kLightColor,
        fontSize: kFontSizeSubtitle1,
      ),
      selectedItemColor: kLightColor,
      selectedLabelStyle: GoogleFonts.montserrat(
        color: kLightColor,
        fontSize: kFontSizeSubtitle1,
      ),
      items: const <BottomNavigationBarItem>[
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
      ],
    );
  }
}
