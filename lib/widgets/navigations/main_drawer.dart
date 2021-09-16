import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/condos/about/about_us_screen.dart';
import 'package:rmp_flutter/screens/login_screen.dart';
import 'package:rmp_flutter/screens/condos/profile/profile_setting_screen.dart';
import 'package:rmp_flutter/widgets/navigations/drawer_button.dart';
import 'package:rmp_flutter/widgets/general/brand_title.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(kSizeXS * 1.5),
        bottomRight: Radius.circular(kSizeXS * 1.5),
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
            Divider(
              color: kDrawerColor,
              thickness: 1,
            ),
            kSizedBoxVerticalS,
            DrawerButton(
              text: "Profile Settings",
              onPressed: () => Navigator.of(context)
                  .pushNamed(ProfileSettingScreen.routeName),
              icon: Icon(
                Icons.account_circle_outlined,
                size: kSizeM,
                color: kBlackColor,
              ),
            ),
            DrawerButton(
              text: "About us",
              onPressed: () =>
                  Navigator.of(context).pushNamed(AboutUsScreen.routeName),
              icon: Icon(
                Icons.info_outline_rounded,
                size: kSizeM,
                color: kBlackColor,
              ),
            ),
            Divider(
              color: kDrawerColor,
              thickness: 1,
            ),
            kSizedBoxVerticalS,
            DrawerButton(
              text: "Log Out",
              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil(LoginScreen.routeName, (_) => false),
              icon: Icon(
                Icons.logout_rounded,
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
