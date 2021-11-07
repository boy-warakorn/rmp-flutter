import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_support_screen.dart';
import 'package:rmp_flutter/screens/residents/home_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_filter_screen.dart';
import 'package:rmp_flutter/screens/residents/postal/resident_postal_screen.dart';
import 'package:rmp_flutter/screens/residents/repair/repair_screen.dart';

class BottomNavBar extends StatelessWidget {
  final PersistentTabController controller;
  final List<Widget> screens;
  final bool isResident;

  const BottomNavBar({
    Key? key,
    required this.controller,
    required this.screens,
    required this.isResident,
  }) : super(key: key);

  List<PersistentBottomNavBarItem> _residentBottomNavBar() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          size: kSizeS * 1.5,
        ),
        title: "Home",
        activeColorPrimary: kBrandLighterColor,
        inactiveColorPrimary: kLightColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.credit_card,
          size: kSizeS * 1.5,
        ),
        title: "Payment",
        activeColorPrimary: kBrandLighterColor,
        inactiveColorPrimary: kLightColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.layers,
          size: kSizeS * 1.5,
        ),
        title: "Postal",
        activeColorPrimary: kBrandLighterColor,
        inactiveColorPrimary: kLightColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.chat_bubble_outline_rounded,
          size: kSizeS * 1.5,
        ),
        title: "Helpdesk",
        activeColorPrimary: kBrandLighterColor,
        inactiveColorPrimary: kLightColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home_repair_service_outlined,
          size: kSizeS * 1.65,
        ),
        title: "Repair",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: kLightColor,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _condoBottomNavBar() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          size: kSizeS * 1.5,
        ),
        title: "Home",
        activeColorPrimary: kBrandLighterColor,
        inactiveColorPrimary: kLightColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.chat_bubble_outline_rounded,
          size: kSizeS * 1.5,
        ),
        title: "Helpdesk",
        activeColorPrimary: kBrandLighterColor,
        inactiveColorPrimary: kLightColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.layers,
          size: kSizeS * 1.5,
        ),
        title: "Postal",
        activeColorPrimary: kBrandLighterColor,
        inactiveColorPrimary: kLightColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: screens,
      controller: controller,
      items: isResident ? _residentBottomNavBar() : _condoBottomNavBar(),
      backgroundColor: kBrandColor,
      navBarStyle: NavBarStyle.style12,
    );
  }
}
