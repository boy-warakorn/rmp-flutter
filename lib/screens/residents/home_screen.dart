import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/announcement_card.dart';

const _dummyData = [
  {
    "title": "Free Pizza 1",
    "subtitle": "Come get free pizza at GYM",
  },
  {
    "title": "Free Pizza 2",
    "subtitle": "Come get free pizza at GYM",
  },
  {
    "title": "Free Pizza 3",
    "subtitle": "Come get free pizza at GYM",
  },
  {
    "title": "Free Pizza 4",
    "subtitle": "Come get free pizza at GYM",
  },
  {
    "title": "Free Pizza 5",
    "subtitle": "Come get free pizza at GYM",
  },
  {
    "title": "Free Pizza 6",
    "subtitle": "Come get free pizza at GYM",
  },
  {
    "title": "Free Pizza 7",
    "subtitle": "Come get free pizza at GYM",
  },
  {
    "title": "Free Pizza 8",
    "subtitle": "Come get free pizza at GYM",
  },
];

class ResidentHomeScreen extends StatelessWidget {
  const ResidentHomeScreen({Key? key}) : super(key: key);

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kSizedBoxVerticalS,
                      kSizedBoxVerticalXS,
                      kSizedBoxHorizontalXXS,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kSizeS * (24 / 16),
                        ),
                        child: Text(
                          "Hi, Warakorn",
                          style:
                              Theme.of(context).textTheme.headline3?.copyWith(
                                    color: kLightColor,
                                  ),
                        ),
                      ),
                      kSizedBoxVerticalS,
                      kSizedBoxVerticalXS,
                      kSizedBoxHorizontalXXS,
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
                            padding: const EdgeInsets.all(
                              kSizeS * (20 / 16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SukJai Condo",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                kSizedBoxVerticalS,
                                kSizedBoxVerticalXS,
                                Container(
                                  color: Colors.amber,
                                  height: kSizeXL,
                                ),
                                kSizedBoxVerticalS,
                                kSizedBoxVerticalXS,
                                Text(
                                  "Announcement",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                kSizedBoxVerticalS,
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: _dummyData.length,
                                    itemBuilder: (context, index) {
                                      return AnnouncementCard(
                                        title: _dummyData[index]['title'].toString(),
                                        subtitle: _dummyData[index]['subtitle'].toString(),
                                      );
                                    },
                                  ),
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
