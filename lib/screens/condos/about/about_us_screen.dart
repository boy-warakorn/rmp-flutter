// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/goal_card.dart';
import 'package:rmp_flutter/widgets/general/team_member_card.dart';
import 'package:rmp_flutter/widgets/layout/scrollable_card_row.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

const littleBearURL =
    "https://i.insider.com/5cdedc95021b4c12a50f46f6?width=1136&format=jpeg";

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ";

class AboutUsScreen extends StatelessWidget {
  static const routeName = "/condo/about";
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: BackAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kSizedBoxVerticalS,
                  kSizedBoxHorizontalXS,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kSizeS * (24 / 16),
                    ),
                    child: Text(
                      "About us",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  kSizedBoxVerticalS,
                  kSizedBoxHorizontalXS,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kSizeS * (24 / 16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: kSizeXL * 1.25,
                            child: Image(
                              image: NetworkImage(littleBearURL),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  kSizedBoxVerticalM,
                  ScollableCardRow(
                    spacingSizedBox: kSizedBoxHorizontalS,
                    cards: [
                      GoalCard(
                        title: "Our Goal",
                        content: loremIpsum,
                        icon: Icon(
                          Icons.ac_unit,
                          color: Colors.red,
                        ),
                      ),
                      GoalCard(
                        title: "Our Goal",
                        content: loremIpsum,
                        icon: Icon(
                          Icons.ac_unit,
                          color: Colors.red,
                        ),
                      ),
                      GoalCard(
                        title: "Our Goal",
                        content: loremIpsum,
                        icon: Icon(
                          Icons.ac_unit,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  kSizedBoxVerticalM,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeS * (24 / 16)),
                    child: Text(
                      "Our Team",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  kSizedBoxVerticalM,
                  kSizedBoxHorizontalS,
                  ScollableCardRow(
                    spacingSizedBox: kSizedBoxHorizontalS,
                    cards: [
                      TeamMemberCard(
                        name: "Anawat Paothong",
                        role: "Role Name",
                        image: NetworkImage(
                          littleBearURL,
                        ),
                      ),
                      TeamMemberCard(
                        name: "Warakorn Chantranupong",
                        role: "Role Name",
                        image: NetworkImage(
                          littleBearURL,
                        ),
                      ),
                      TeamMemberCard(
                        name: "Noppanut Boonrueng",
                        role: "Role Name",
                        image: NetworkImage(
                          littleBearURL,
                        ),
                      )
                    ],
                  ),
                  kSizedBoxVerticalL,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
