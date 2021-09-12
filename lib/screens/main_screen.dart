import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:rmp_flutter/screens/condos/dashboard/dashboard_screen.dart';
import 'package:rmp_flutter/screens/condos/help-desk/help_desk_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_screen.dart';
import 'package:rmp_flutter/screens/widget_preview_screen.dart';
import 'package:rmp_flutter/widgets/navigations/app_bar.dart';
import 'package:rmp_flutter/widgets/navigations/bottom_bar.dart';
import 'package:rmp_flutter/widgets/navigations/main_drawer.dart';

class MainScreen extends HookWidget {
  static const routeName = '/';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      const WidgetPreviewScreen(),
      const HelpDeskScreen(),
      const PostalScreen()
    ];

    final _currentTabIndex = useState(0);

    void onTap(int index) {
      _currentTabIndex.value = index;
    }

    return Scaffold(
      appBar: MainAppBar(haveFilter: false),
      drawer: MainDrawer(),
      body: _tabs[_currentTabIndex.value],
      bottomNavigationBar: BottomBar(
        currentIndex: _currentTabIndex.value,
        isResident: false,
        onTap: onTap,
      ),
    );
  }
}
