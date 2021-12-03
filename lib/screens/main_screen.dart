import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/repositories/user_repository.dart';
import 'package:rmp_flutter/screens/condos/dashboard/dashboard_screen.dart';
import 'package:rmp_flutter/screens/condos/help-desk/help_desk_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_add_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_form_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_support_screen.dart';
import 'package:rmp_flutter/screens/residents/home_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_filter_screen.dart';
import 'package:rmp_flutter/screens/residents/postal/resident_postal_screen.dart';
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
];

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final _role = ref.read(currentUser).user.role;
    final _isResident = _role == "resident";
    final _currentTabIndex = useState(0);
    final _paymentResident = "0";
    final _postalResident = "2";
    final _helpdeskResident = "4";
    final _helpdeskCondo = "3";

    void requestPermission() async {
      final test = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }

    void updateDeviceId() async {
      String token = await FirebaseMessaging.instance.getToken() as String;
      await UserRepository().updateDeviceId(token);
    }

    useEffect(() {
      requestPermission();
      updateDeviceId();
    }, []);

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
        paymentResident: _paymentResident,
        helpdeskResident: _helpdeskResident,
        postalResident: _postalResident,
        helpdeskCondo: _helpdeskCondo,
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
