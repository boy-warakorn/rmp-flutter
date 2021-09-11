import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/drawer_button.dart';
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
              child: SizedBox(
                height: kSizeS,
              ),
            ),
            BrandTitle(
                brandLogo: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  height: kSizeM,
                  width: kSizeM,
                ),
                brandTitle: 'Condominium'),
            Divider(),
            SafeArea(
              child: SizedBox(
                height: kSizeS,
              ),
            ),
            DrawerButton(
              text: "Profile Settings",
              onPressed: () => print('Hello World'),
              icon: Icon(
                Icons.account_circle_outlined,
                size: kSizeM,
                color: kBlackColor,
              ),
            ),
            DrawerButton(
              text: "About us",
              onPressed: () => print('Hello World'),
              icon: Icon(
                Icons.info_outline_rounded,
                size: kSizeM,
                color: kBlackColor,
              ),
            ),
            Divider(),
            SafeArea(
              child: SizedBox(
                height: kSizeS,
              ),
            ),
            DrawerButton(
              text: "Log Out",
              onPressed: () => print('Hello World'),
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
