import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/widgets/general/announcement_card.dart';

const _dummyData = [
  {
    "title": "Free Pizza 1",
    "subtitle": "Come get free pizza at GYM",
  },
];

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: EdgeInsets.all(kSizeXS),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(kSizeXS),
          ),
          child: Stack(
            children: <Widget>[
              Image.network(
                item,
                fit: BoxFit.cover,
                width: kSizeXXXL * 2,
              ),
            ],
          ),
        ),
      ),
    )
    .toList();

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
                        child: Text(
                          "Hi, ${_curUser.user.name}",
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
                                  width: MediaQuery.of(context).size.width,
                                  height: kSizeXL * 1.25,
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      enlargeCenterPage: true,
                                      aspectRatio: 1,
                                    ),
                                    items: imageSliders,
                                  ),
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
