import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
import 'package:rmp_flutter/screens/residents/repair/repair_form_screen.dart';
import 'package:rmp_flutter/screens/residents/repair/repair_screen.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/navigations/app_bar.dart';
import 'package:rmp_flutter/widgets/navigations/bottom_bar.dart';
import 'package:rmp_flutter/widgets/navigations/bottom_nav_bar.dart';
import 'package:rmp_flutter/widgets/navigations/main_drawer.dart';

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
  const RepairScreen(),
];

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _role = ref.read(currentUser).user.role;
    final _isResident = _role == "resident";
    final _currentTabIndex = useState(0);
    final PersistentTabController _controller =
        PersistentTabController(initialIndex: _currentTabIndex.value);

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: MainAppBar(
        haveFilter: false, //_currentTabIndex.value > 0 ? true :
      ),
      drawer: MainDrawer(),
      body: _role.isEmpty
          ? CenteredProgressIndicator()
          : BottomNavBar(
              controller: _controller,
              isResident: _isResident,
              screens: _isResident ? _residentTabs : _condoTabs,
            ),
      floatingActionButton: (_controller.index == 2 && !_isResident) ||
              (_controller.index == 3 && _isResident) ||
              (_controller.index == 4 && _isResident)
          ? Container(
              margin: EdgeInsets.only(
                bottom: kSizeM * 1.75,
              ),
              child: FloatingActionButton(
                onPressed: () {
                  if (_currentTabIndex.value == 3 && _isResident) {
                    Navigator.of(context)
                        .pushNamed(ContactFormScreen.routeName);
                  } else if (_currentTabIndex.value == 4 && _isResident) {
                    Navigator.of(context).pushNamed(RepairFormScreen.routeName);
                  } else {
                    Navigator.of(context).pushNamed(PostalAddScreen.routeName);
                  }
                },
                child: Icon(
                  Icons.add,
                  color: kLightColor,
                  size: kSizeM,
                ),
                backgroundColor: kBrandColor,
              ),
            )
          : null,
    );
  }
}
