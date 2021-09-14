import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/alert_box.dart';
import 'package:rmp_flutter/widgets/general/card_button.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/general/custom_slider.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/general/entity_card_status.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
import 'package:rmp_flutter/widgets/general/goal_card.dart';
import 'package:rmp_flutter/widgets/general/help_desk_card.dart';
import 'package:rmp_flutter/widgets/general/package_card.dart';
import 'package:rmp_flutter/widgets/general/payment_card.dart';
import 'package:rmp_flutter/widgets/general/summary_entity.dart';
import 'package:rmp_flutter/widgets/general/team_member_card.dart';
import 'package:rmp_flutter/widgets/general/title_card.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

// เอาไว้ทดสอบข้อความยาว
const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ornare accumsan nulla non accumsan. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam eget pharetra lacus. Maecenas et dolor blandit, sodales justo pharetra,";
const littleBearURL =
    "https://i.insider.com/5cdedc95021b4c12a50f46f6?width=1136&format=jpeg";
const String fieldName = "Room Number";

class WidgetPreviewScreen extends HookWidget {
  Size get preferredSize => const Size.fromHeight(kSizeM * 1.75);
  const WidgetPreviewScreen({Key? key}) : super(key: key);

  Future<void> _showAlertBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) => AlertBox(
        message: "Are you sure?",
        onNegative: () => Navigator.pop(context),
        onPositive: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _example = useTextEditingController();
    return SafeArea(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardButton(
                title: "GET QR CODE",
                onPressed: () => print("CardButton: Pressed"),
                icon: Icons.qr_code,
              ),
              kSizedBoxHorizontalS,
              CardButton(
                title: "GET QR CODE",
                onPressed: () => print("CardButton: Pressed"),
                icon: Icons.qr_code,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleCard(
                title: "TitleCard - icon",
                subtitle: "new: 45",
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.red,
                ),
              ),
              TitleCard(
                title: "TitleCard - no icon",
                subtitle: 12.toString(),
              ),
            ],
          ),
          PaymentCard(
            type: "Pay type",
            amount: "500 THB",
            paidDate: "20/20/2020",
            onPressed: () => print("Pressed"),
          ),
          CardTemplate(
            child: Column(
              children: const [
                SummaryEntity(
                  text: "SummaryEntity(1-9 counts)",
                  count: 5,
                ),
                SummaryEntity(
                  text: "SummaryEntity(9+ counts)",
                  count: 16,
                ),
              ],
            ),
          ),
          CustomButton(
            text: "CustomButton - default color",
            onPressed: () => print("CustomButton: Pressed"),
          ),
          const SizedBox(height: 4),
          CustomButton(
            text: "CustomButton - colored",
            onPressed: () => print("CustomButton - colored: Pressed"),
            color: Colors.blueGrey,
          ),
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
          const EntityCard(
            title: "EntityCard",
            date: "20/20/2020",
            entityStatus: EntityCardStatus(
              text: "Recieved",
              color: kSuccessColor,
            ),
          ),
          TitleCard(
            title: "TitleCard - no icon",
            subtitle: 12.toString(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                TeamMemberCard(
                  name: "Anawat Paothong",
                  role: "Role Name",
                  image: NetworkImage(
                    littleBearURL,
                  ),
                ),
                kSizedBoxHorizontalS,
                TeamMemberCard(
                  name: "Warakorn Chantranupong",
                  role: "Role Name",
                  image: NetworkImage(
                    littleBearURL,
                  ),
                ),
                kSizedBoxHorizontalS,
                TeamMemberCard(
                  name: "Noppanut Boonrueng",
                  role: "Role Name",
                  image: NetworkImage(
                    littleBearURL,
                  ),
                )
              ],
            ),
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
          CustomSlider(
            isResponded: true,
            onValueChanged: (val) => print(val),
          ),
          GoalCard(
            title: "GoalCard",
            content: loremIpsum,
            icon: Icon(
              Icons.ac_unit,
              color: Colors.red,
            ),
          ),
          FormTextField(
            fieldName: fieldName,
            textEditingController: _example,
          ),
        ],
      ),
    );
  }
}
