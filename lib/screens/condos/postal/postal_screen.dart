import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/condos/postal/package_detail_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_add_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_edit_screen.dart';
import 'package:rmp_flutter/widgets/general/package_card.dart';

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
              horizontal: kSizeS * 1.5,
              vertical: kSizeS,
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
              padding: EdgeInsets.all(
                kSizeS * 1.5,
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
                  kSizedBoxVerticalXS,
                  kSizedBoxVerticalS,
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, index) => PackageCard(
                        title: "Gaming Monitor",
                        date: "13/9/2021",
                        note: "24 inches monitor",
                        onPressed: () => print('Hello World'),
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
