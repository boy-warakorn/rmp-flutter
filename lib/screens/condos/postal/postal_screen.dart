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
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[kBrandColor, kBrandAlternativeDarkerColor],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                kSizedBoxVerticalXS,
                kSizedBoxVerticalS,
                Container(
                  margin: EdgeInsets.only(
                    left: kSizeM,
                  ),
                  child: Text(
                    "Postal Management",
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: kLightColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
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
                kSizedBoxVerticalXS,
                kSizedBoxVerticalS,
                Container(
                  margin: EdgeInsets.only(
                    left: kSizeM,
                  ),
                  child: Text(
                    "All Packages",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: kFontSizeHeadline3,
                          color: kBrandDarkerColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                kSizedBoxVerticalXS,
                kSizedBoxVerticalS,
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kSizeS,
                  ),
                  child: PackageCard(
                    title: "Gaming Monitor",
                    date: "13/9/2021",
                    note: "24 inches monitor",
                    onPressed: () => print('this is package.'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kSizeS,
                  ),
                  child: PackageCard(
                    title: "Gaming Monitor",
                    date: "13/9/2021",
                    note: "24 inches monitor",
                    onPressed: () => print('this is package.'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kSizeS,
                  ),
                  child: PackageCard(
                    title: "Gaming Monitor",
                    date: "13/9/2021",
                    note: "24 inches monitor",
                    onPressed: () => print('this is package.'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(
            right: kSizeS,
            bottom: kSizeS,
          ),
          child: FloatingActionButton(
            elevation: 10,
            onPressed: () => print('onPressed'),
            child: Icon(
              Icons.add,
              size: kSizeM,
            ),
            backgroundColor: kBrandColor,
          ),
        ),
      ],
    );
  }
}
