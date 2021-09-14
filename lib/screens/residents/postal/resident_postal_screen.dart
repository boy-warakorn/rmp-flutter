// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/general/entity_card_status.dart';
import 'package:rmp_flutter/widgets/general/title_card.dart';

const _dummyData = [
  {
    "title": "P1",
    "date": "20/20/2000",
    "status": "recieved",
  },
  {
    "title": "P2",
    "date": "20/20/2000",
    "status": "recieved",
  },
  {
    "title": "P3",
    "date": "20/20/2000",
    "status": "in-office",
  },
  {
    "title": "P4",
    "date": "20/20/2000",
    "status": "in-office",
  },
  {
    "title": "P5",
    "date": "20/20/2000",
    "status": "recieved",
  },
];

class ResidentPostalScreen extends StatelessWidget {
  static const routeName = "/resident/postal";
  const ResidentPostalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: const <Color>[
                        kBrandColor,
                        kBrandAlternativeDarkerColor,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      kSizedBoxHorizontalS,
                      kSizedBoxHorizontalXS,
                      kSizedBoxVerticalXXS,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kSizeS * (24 / 16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TitleCard(
                                    title: "Recieved",
                                    subtitle: 100.toString(),
                                    icon: Icon(
                                      Icons.ac_unit,
                                      color: kStrokeColor,
                                    ),
                                  ),
                                ),
                                kSizedBoxHorizontalS,
                                Expanded(
                                  child: TitleCard(
                                    title: "Not Recieved",
                                    subtitle: 100.toString(),
                                    icon: Icon(
                                      Icons.ac_unit,
                                      color: kErrorColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      kSizedBoxVerticalS,
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: kLightColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kSizeS),
                              topRight: Radius.circular(kSizeS),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(kSizeS),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "All Packages",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                kSizedBoxVerticalS,
                                kSizedBoxVerticalXS,
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: _dummyData.length,
                                    itemBuilder: (context, index) {
                                      final data = _dummyData[index];

                                      return EntityCard(
                                          title: "${data['title']}",
                                          date: "${data['date']}",
                                          entityStatus:
                                              data['status'] == "recieved"
                                                  ? EntityCardStatus(
                                                      text: "Recieved",
                                                      color: kSuccessColor)
                                                  : EntityCardStatus(
                                                      text: "In-office",
                                                      color: kWarningColor));
                                    },
                                  ),
                                ),
                                kSizedBoxVerticalS,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomButton(
                                      text: "SHOW IDENTIFICATION",
                                      onPressed: () => print("IDEN"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
