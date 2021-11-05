import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/residents/repair/repair_detail_screen.dart';
import 'package:rmp_flutter/screens/residents/repair/repair_form_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';

class RepairScreen extends HookConsumerWidget {
  static const routeName = "/resident/repair";
  const RepairScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    "All Repair and Maintenance",
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
                            Navigator.of(context).pushNamed(
                              RepairFormScreen.routeName,
                            ),
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
    );
  }
}
