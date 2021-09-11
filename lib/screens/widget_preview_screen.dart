import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/widgets/general/app_bar.dart';
import 'package:rmp_flutter/widgets/general/back_app_bar.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/general/goal_card.dart';
import 'package:rmp_flutter/widgets/general/help_desk_card.dart';
import 'package:rmp_flutter/widgets/general/package_card.dart';
import 'package:rmp_flutter/widgets/general/title_card.dart';
import 'package:rmp_flutter/widgets/general/main_drawer.dart';

// เอาไว้ทดสอบข้อความยาว
const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ornare accumsan nulla non accumsan. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam eget pharetra lacus. Maecenas et dolor blandit, sodales justo pharetra,";

class WidgetPreviewScreen extends StatelessWidget {
  Size get preferredSize => const Size.fromHeight(50);
  const WidgetPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        haveFilter: true,
      ),
      drawer: MainDrawer(),
      backgroundColor: kBgColor,
      body: SafeArea(
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleCard(
                title: "TitleCard - iconnnn",
                count: 5,
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.red,
                ),
              ),
              TitleCard(
                title: "TitleCard - no icon",
                count: 12,
              ),
            ],
          ),
          CustomButton(
              text: "CustomButton - default color",
              onPressed: () => print("CustomButton: Pressed")),
          SizedBox(height: 4),
          CustomButton(
              text: "CustomButton - colored",
              onPressed: () => print("CustomButton - colored: Pressed"),
              color: Colors.blueGrey),
          HelpDeskCard(
            title: "Title",
            date: "20/20/2020",
            detail: "Short detail",
            actionButton: CustomButton(
                text: "REPLY", onPressed: () => print("HelpDeskCard: Pressed")),
          ),
          HelpDeskCard(
            title: "Title long detail",
            date: "20/20/2020",
            detail: loremIpsum,
            actionButton: CustomButton(
                text: "REPLY", onPressed: () => print("HelpDeskCard: Pressed")),
          ),
          PackageCard(
            title: "Title",
            date: "20/20/2020",
            onPressed: () => print("PackageCard: Pressed"),
            note: "-",
          ),
          PackageCard(
            title: "Title with Note",
            date: "20/20/2020",
            onPressed: () => print("PackageCard note: Pressed"),
            note: loremIpsum,
          ),
          GoalCard(
            title: "GoalCard",
            content: loremIpsum,
            icon: Icon(
              Icons.ac_unit,
              color: Colors.red,
            ),
          ),
        ]),
      ),
    );
  }
}
