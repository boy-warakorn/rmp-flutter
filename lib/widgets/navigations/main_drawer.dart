import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/screens/about/about_us_screen.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/screens/profile/profile_setting_screen.dart';
import 'package:rmp_flutter/widgets/navigations/drawer_button.dart';
import 'package:rmp_flutter/widgets/general/brand_title.dart';

class MainDrawer extends HookConsumerWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _curUser = ref.watch(currentUser);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(kSizeXS * 1.5),
        bottomRight: Radius.circular(kSizeXS * 1.5),
      ),
      child: Drawer(
        child: ListView(
          children: [
            kSizedBoxVerticalS,
            BrandTitle(
              brandLogo: Image.asset(
                'assets/images/rmp_ex.png',
                height: kSizeM * 1.5,
                width: kSizeM * 1.5,
              ),
              brandTitle: _curUser.user.businessName,
            ),
            const Divider(
              color: kDrawerColor,
              thickness: 1,
            ),
            kSizedBoxVerticalS,
            DrawerButton(
              text: "Profile Settings",
              onPressed: () => Navigator.of(context)
                  .pushNamed(ProfileSettingScreen.routeName),
              icon: const Icon(
                Icons.account_circle_outlined,
                size: kSizeM,
                color: kBlackColor,
              ),
            ),
            DrawerButton(
              text: "About us",
              onPressed: () =>
                  Navigator.of(context).pushNamed(AboutUsScreen.routeName),
              icon: const Icon(
                Icons.info_outline_rounded,
                size: kSizeM,
                color: kBlackColor,
              ),
            ),
            const Divider(
              color: kDrawerColor,
              thickness: 1,
            ),
            kSizedBoxVerticalS,
            DrawerButton(
              text: "Log Out",
              onPressed: () => {
                _curUser.clearUser(),
                Navigator.of(context).pushNamedAndRemoveUntil(
                  PreLoadingScreen.routeName,
                  (_) => false,
                )
              },
              icon: const Icon(
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
