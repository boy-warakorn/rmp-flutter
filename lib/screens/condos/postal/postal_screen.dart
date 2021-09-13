import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/package_card.dart';

class PostalScreen extends StatelessWidget {
  const PostalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(
            kSizeS * 1.5,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                kBrandColor,
                kBrandAlternativeDarkerColor,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                PackageCard(
                  title: "Gaming Monitor",
                  date: "13/9/2021",
                  note: "24 inches monitor",
                  onPressed: () => print('this is package.'),
                ),
                PackageCard(
                  title: "Gaming Monitor",
                  date: "13/9/2021",
                  note: "24 inches monitor",
                  onPressed: () => print('this is package.'),
                ),
                PackageCard(
                  title: "Gaming Monitor",
                  date: "13/9/2021",
                  note: "24 inches monitor",
                  onPressed: () => print('this is package.'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
