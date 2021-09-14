import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/screens/condos/dashboard/dashboard_screen.dart';
import 'package:rmp_flutter/screens/condos/help-desk/help_desk_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_support_screen.dart';
import 'package:rmp_flutter/screens/residents/home_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/specific_payment_screen.dart';
import 'package:rmp_flutter/screens/residents/postal/resident_postal_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_screen.dart';
import 'package:rmp_flutter/screens/widget_preview_screen.dart';
import 'package:rmp_flutter/widgets/navigations/app_bar.dart';
import 'package:rmp_flutter/widgets/navigations/bottom_bar.dart';
import 'package:rmp_flutter/widgets/navigations/main_drawer.dart';

class MainScreen extends HookWidget {
  static const routeName = '/';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const isResident = true;

    final _condoTabs = [
      const DashboardScreen(),
      const HelpDeskScreen(),
      const PostalScreen()
    ];

    final _residentTabs = [
      const ResidentHomeScreen(),
      const PaymentScreen(),
      const ResidentPostalScreen(),
      const ContactSupportScreen(),
    ];

    final _currentTabIndex = useState(0);

    void onTap(int index) {
      _currentTabIndex.value = index;
    }

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: MainAppBar(
        haveFilter: false,
      ),
      drawer: MainDrawer(),
      body: isResident
          ? _residentTabs[_currentTabIndex.value]
          : _condoTabs[_currentTabIndex.value],
      bottomNavigationBar: BottomBar(
        currentIndex: _currentTabIndex.value,
        isResident: isResident,
        onTap: onTap,
      ),
    );
  }
}
