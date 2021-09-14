import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/condos/postal/package_detail_screen.dart';
import 'package:rmp_flutter/widgets/general/package_card.dart';
import 'package:rmp_flutter/widgets/navigations/app_bar.dart';
import 'package:rmp_flutter/widgets/navigations/main_drawer.dart';

class PostalScreen extends StatelessWidget {
  static const routeName = "/condo/postal";
  const PostalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            kBrandColor,
            kBrandAlternativeDarkerColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: kSizeS,
              horizontal: kSizeS * 1.5,
            ),
            child: Column(
              children: [
                Text(
                  "Postal Management",
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: kLightColor,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: kSizeS * 1.5,
                right: kSizeS * 1.5,
                top: kSizeS,
              ),
              decoration: BoxDecoration(
                color: kBgColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    kSizeS,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All Packages",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: kFontSizeHeadline3,
                          color: kBrandDarkerColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  kSizedBoxVerticalS,
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, index) => PackageCard(
                        title: "Gaming Monitor",
                        date: "13/9/2021",
                        note: "24 inches monitor",
                        onPressed: () => Navigator.of(context)
                            .pushNamed(PackageDetailScreen.routeName),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
