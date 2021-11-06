import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/screens/condos/dashboard/dashboard_screen.dart';
import 'package:rmp_flutter/screens/condos/help-desk/help_desk_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_add_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_form_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_support_screen.dart';
import 'package:rmp_flutter/screens/residents/home_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_filter_screen.dart';
import 'package:rmp_flutter/screens/residents/postal/resident_postal_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_screen.dart';
import 'package:rmp_flutter/screens/residents/repair/repair_screen.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/navigations/app_bar.dart';
import 'package:rmp_flutter/widgets/navigations/bottom_bar.dart';
import 'package:rmp_flutter/widgets/navigations/main_drawer.dart';

final _condoTabs = [
  const DashboardScreen(),
  const HelpDeskScreen(),
  const PostalScreen()
];

final _residentTabs = [
  const ResidentHomeScreen(),
  const PaymentFilterScreen(),
  const ResidentPostalScreen(),
  const ContactSupportScreen(),
  const RepairScreen(),
];

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _role = ref.read(currentUser).user.role;
    final _isResident = _role == "resident";
    final _currentTabIndex = useState(0);

    void onTap(int index) {
      _currentTabIndex.value = index;
    }

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: MainAppBar(
        haveFilter: false, //_currentTabIndex.value > 0 ? true :
      ),
      drawer: MainDrawer(),
      body: _role.isEmpty
          ? CenteredProgressIndicator()
          : _isResident
              ? _residentTabs[_currentTabIndex.value]
              : _condoTabs[_currentTabIndex.value],
      bottomNavigationBar: BottomBar(
        currentIndex: _currentTabIndex.value,
        isResident: _isResident,
        onTap: onTap,
      ),
      floatingActionButton: (_currentTabIndex.value == 2 && !_isResident) ||
              (_currentTabIndex.value == 3 && _isResident)
          ? FloatingActionButton(
              onPressed: () => _isResident
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
