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

const boyUrl =
    "https://scontent.fbkk28-1.fna.fbcdn.net/v/t1.6435-9/125310554_4728439347229219_2719125093318069936_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=_bCT5FI77GAAX8e71FC&_nc_ht=scontent.fbkk28-1.fna&oh=254a75b2d879788ddfa7cf3785a1e9b1&oe=61724293";

const paintUrl =
    "https://scontent.fbkk28-1.fna.fbcdn.net/v/t1.6435-1/p160x160/62169127_2682882728452752_8706083457010237440_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=7206a8&_nc_ohc=KTdPyLtt_M4AX97qp64&_nc_ht=scontent.fbkk28-1.fna&oh=ae2e4705b27ebf442dc0734c2eb1a9fd&oe=616F1B80";

const ohnUrl =
    "https://scontent.fbkk28-1.fna.fbcdn.net/v/t1.6435-9/59433064_1153121144874742_3175276997039357952_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=VwClqEnpPIYAX_9KaUS&_nc_ht=scontent.fbkk28-1.fna&oh=c9dd7dae2245c31fea11760fd6d1e27b&oe=61700076";

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ";

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
                        content: loremIpsum,
                        icon: Icon(
                          Icons.favorite_outline,
                          color: kErrorColor,
                        ),
                      ),
                      GoalCard(
                        title: "Our Goal",
                        content: loremIpsum,
                        icon: Icon(
                          Icons.lightbulb_outline,
                          color: kWarningColor,
                        ),
                      ),
                      GoalCard(
                        title: "Our Vision",
                        content: loremIpsum,
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
