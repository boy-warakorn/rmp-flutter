import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/navigations/app_bar.dart';

class RepairDetailScreen extends HookWidget {
  static const routeName = "/resident/repair-detail";
  const RepairDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        haveFilter: false,
      ),
      body: Container(
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
              padding: EdgeInsets.only(
                left: kSizeS * 1.5,
                top: kSizeS * 1.5,
                bottom: kSizeS,
              ),
              child: Column(
                children: [
                  CustomText.sectionHeaderLight(
                    "Repair and Maintenance",
                    context,
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
                    CustomText.sectionHeader(
                      "Repair history",
                      context,
                    ),
                    kSizedBoxVerticalS,
                    Expanded(
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (ctx, index) {
                          return EntityCard(
                            title: "This is title",
                            subtitle: "Informed Date: -",
                            statusKey: "In progress",
                            onPressed: () => {
                              print('go to repair detail'),
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
