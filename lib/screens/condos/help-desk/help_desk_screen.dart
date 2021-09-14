import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/general/custom_slider.dart';
import 'package:rmp_flutter/widgets/general/help_desk_card.dart';

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ornare accumsan nulla non accumsan. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam eget pharetra lacus. Maecenas et dolor blandit, sodales justo pharetra,";

const dummy = [
  {
    "title": "T1",
    "date": "20/20/2202",
    "detail": loremIpsum,
    "isResponded": true,
  },
  {
    "title": "T2",
    "date": "20/20/2202",
    "detail": loremIpsum,
    "isResponded": false,
  },
  {
    "title": "T3",
    "date": "20/20/2202",
    "detail": loremIpsum,
    "isResponded": true,
  },
];

class HelpDeskScreen extends HookWidget {
  static const routeName = "/condo/helpdesk";

  const HelpDeskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isResponded = useState(true);

    void switchResponded(bool switchTo) {
      _isResponded.value = switchTo;
    }

    List<Map<String, dynamic>> filterList() {
      return dummy
          .where((ele) => ele["isResponded"] == _isResponded.value)
          .toList();
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSizeS * (24 / 16),
        ),
        child: Column(
          children: [
            kSizedBoxVerticalS,
            kSizedBoxVerticalXS,
            CustomSlider(
              isResponded: _isResponded.value,
              onValueChanged: (switchTo) => switchResponded(switchTo),
            ),
            kSizedBoxVerticalS,
            kSizedBoxHorizontalXS,
            Expanded(
              child: ListView.builder(
                itemCount: filterList().length,
                itemBuilder: (context, index) => HelpDeskCard(
                  title: "${filterList()[index]["title"]}",
                  date: "${filterList()[index]["date"]}",
                  detail: "${filterList()[index]["detail"]}",
                  actionButton: filterList()[index]["isResponded"] as bool
                      ? const SizedBox()
                      : CustomButton(
                          onPressed: () => print("Reply"),
                          text: "Reply",
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
