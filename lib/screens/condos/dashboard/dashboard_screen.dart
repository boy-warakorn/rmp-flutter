import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/summary_entity.dart';
import 'package:rmp_flutter/widgets/general/title_card.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "/condo/dashboard";

  const DashboardScreen({Key? key}) : super(key: key);

  Widget _buildTitleCardGroup(
    BuildContext context, {
    required String header,
    required TitleCard leftCard,
    required TitleCard rightCard,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: Theme.of(context).textTheme.headline3,
        ),
        Row(
          children: [
            Expanded(
              child: leftCard,
            ),
            const SizedBox(
              width: kSizeXS,
            ),
            Expanded(
              child: rightCard,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            kSizeS * (24 / 16),
          ),
          child: Container(
            child: Column(
              children: [
                _buildTitleCardGroup(
                  context,
                  header: "Postal Package",
                  leftCard: TitleCard(
                    title: "Recieved",
                    count: 5,
                  ),
                  rightCard: TitleCard(
                    title: "Total",
                    count: 5,
                  ),
                ),
                kSizedBoxVerticalS,
                _buildTitleCardGroup(
                  context,
                  header: "Residential Report",
                  leftCard: TitleCard(
                    title: "Unread",
                    count: 5,
                  ),
                  rightCard: TitleCard(
                    title: "Replied",
                    count: 5,
                  ),
                ),
                kSizedBoxVerticalS,
                CardTemplate(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("All Reports", style: Theme.of(context).textTheme.headline4,),
                      SizedBox(height: kSizeS * (24 / 16),),
                      SummaryEntity(text: "Summ", count: 1,),
                      SummaryEntity(text: "Summ", count: 9,),
                      SummaryEntity(text: "Summ", count: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
