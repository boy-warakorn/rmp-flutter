import 'package:flutter/material.dart';
import 'package:rmp_flutter/widgets/general/title_card.dart';

class WidgetPreviewScreen extends StatelessWidget {
  const WidgetPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          TitleCard(
            title: "Title 01",
            count: 5,
            icon: Icon(
              Icons.ac_unit,
              color: Colors.lightBlue,
            ),
          ),
          TitleCard(
            title: "Title 02 no Icon",
            count: 12,
          ),
        ]),
      ),
    );
  }
}
