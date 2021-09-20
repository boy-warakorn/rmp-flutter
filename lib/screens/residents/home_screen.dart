import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/widgets/general/announcement_card.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';

const _dummyData = [
  {
    "title": "Free Pizza 1",
    "subtitle": "Come get free pizza at GYM",
  },
];

class ResidentHomeScreen extends HookConsumerWidget {
  const ResidentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _curUser = ref.watch(currentUser);

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
                        child: CustomText.sectionHeaderLight(
                          "Hi, ${_curUser.user.name}",
                          context,
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
                                CustomText.sectionHeader(
                                  "Sukjai Condo",
                                  context,
                                ),
                                kSizedBoxVerticalS,
                                kSizedBoxVerticalXS,
                                Container(
                                  color: Colors.amber,
                                  height: kSizeXL,
                                ),
                                kSizedBoxVerticalS,
                                kSizedBoxVerticalXS,
                                CustomText.sectionHeader(
                                  "Announcement",
                                  context,
                                ),
                                kSizedBoxVerticalS,
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: _dummyData.length,
                                    itemBuilder: (context, index) {
                                      return AnnouncementCard(
                                        title: _dummyData[index]['title']
                                            .toString(),
                                        subtitle: _dummyData[index]['subtitle']
                                            .toString(),
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
