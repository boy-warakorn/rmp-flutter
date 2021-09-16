import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/condos/dashboard/dashboard_screen.dart';
import 'package:rmp_flutter/screens/condos/help-desk/help_desk_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_add_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_form_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_support_screen.dart';
import 'package:rmp_flutter/screens/residents/home_screen.dart';
import 'package:rmp_flutter/screens/residents/postal/resident_postal_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_screen.dart';
import 'package:rmp_flutter/widgets/navigations/app_bar.dart';
import 'package:rmp_flutter/widgets/navigations/bottom_bar.dart';
import 'package:rmp_flutter/widgets/navigations/main_drawer.dart';

class MainScreen extends HookWidget {
  static const routeName = '/';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const isResident = false;

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
        haveFilter: _currentTabIndex.value > 0 ? true : false,
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
      floatingActionButton: (_currentTabIndex.value == 2 && !isResident) ||
              (_currentTabIndex.value == 3 && isResident)
          ? FloatingActionButton(
              onPressed: () => isResident
                  ? Navigator.of(context).pushNamed(ContactFormScreen.routeName)
                  : Navigator.of(context).pushNamed(PostalAddScreen.routeName),
              child: Icon(
                Icons.add,
                color: kLightColor,
                size: kSizeM,
              ),
              backgroundColor: kBrandColor,
            )
          : null,
    );
  }
}
