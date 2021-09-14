import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/condos/login_screen.dart';
import 'package:rmp_flutter/screens/condos/profile/profile_setting_screen.dart';
import 'package:rmp_flutter/widgets/navigations/drawer_button.dart';
import 'package:rmp_flutter/widgets/general/brand_title.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(kSizeS),
        bottomRight: Radius.circular(kSizeS),
      ),
      child: Drawer(
        child: ListView(
          children: [
            SafeArea(
              child: kSizedBoxVerticalS,
            ),
            BrandTitle(
                brandLogo: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  height: kSizeM,
                  width: kSizeM,
                ),
                brandTitle: 'Condominium'),
            Divider(),
            SafeArea(child: kSizedBoxVerticalS),
            DrawerButton(
              text: "Profile Settings",
              onPressed: () =>
                  Navigator.of(context).pushNamed('/condo/profile'),
              icon: Icon(
                Icons.account_circle_outlined,
                size: kSizeM,
                color: kBlackColor,
              ),
            ),
            DrawerButton(
              text: "About us",
              onPressed: () => Navigator.of(context).pushNamed('/condo/about'),
              icon: Icon(
                Icons.info_outline_rounded,
                size: kSizeM,
                color: kBlackColor,
              ),
            ),
            Divider(),
            SafeArea(
              child: kSizedBoxVerticalS,
            ),
            DrawerButton(
              text: "Log Out",
              onPressed: () => Navigator.of(context).pushNamed('/login'),
              icon: Icon(
                Icons.logout_outlined,
                size: kSizeM,
                color: kBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
