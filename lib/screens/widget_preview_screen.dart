import 'package:flutter/material.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/general/help_desk_card.dart';
import 'package:rmp_flutter/widgets/general/title_card.dart';

class WidgetPreviewScreen extends StatelessWidget {
  const WidgetPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          TitleCard(
            title: "TitleCard - icon",
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
          CustomButton(text: "EDIT", onClick: () => print("YES")),
        ]),
      ),
    );
  }
}
