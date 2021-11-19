// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/goal_card.dart';
import 'package:rmp_flutter/widgets/general/team_member_card.dart';
import 'package:rmp_flutter/widgets/layout/scrollable_card_row.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ";

const obj = "We aim this application will improve communication between condo's personnel and resident. And we hope this application will help you reduce load of work.";
const value = "Our value is to give convenience for all users to use this application and manage the work. It is easy to use and less time to learn how to use. Also beautiful UI.";
const vision = "We saw that many resident managements struggle about their communication and work, so we build this application to solve their communication and work problem.";

class AboutUsScreen extends StatelessWidget {
  static const routeName = "/about";
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
                              image: AssetImage("assets/images/8401.png"),
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
                        title: "Our Value",
                        content: value,
                        icon: Icon(
                          Icons.favorite_outline,
                          color: kErrorColor,
                        ),
                      ),
                      GoalCard(
                        title: "Our Goal",
                        content: obj,
                        icon: Icon(
                          Icons.lightbulb_outline,
                          color: kWarningColor,
                        ),
                      ),
                      GoalCard(
                        title: "Our Vision",
                        content: vision,
                        icon: Icon(
                          Icons.visibility_outlined,
                          color: kStrokeColor,
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
                        role: "Developer",
                        image: AssetImage(
                          "assets/images/paint_anawat.jpg",
                        ),
                      ),
                      TeamMemberCard(
                        name: "Warakorn Chantranupong",
                        role: "Project Manager",
                        image: AssetImage(
                          "assets/images/boy_warakorn.jpg",
                        ),
                      ),
                      TeamMemberCard(
                        name: "Noppanut Boonrueng",
                        role: "Developer",
                        image: AssetImage(
                          "assets/images/ohn_noppanut.jpg",
                        ),
                      )
                    ],
                  ),
                  kSizedBoxVerticalM,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
