// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/screens/residents/postal/profile_card_screen.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/general/empty_list_display.dart';
import 'package:rmp_flutter/widgets/general/resident_package_card.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/interactions/text_tab.dart';

const dummyImgUrl =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png";

class ResidentPostalScreen extends HookWidget {
  static const routeName = "/resident/postal";
  const ResidentPostalScreen({Key? key}) : super(key: key);

  static const _tabs = [
    "Received",
    "Not Received",
  ];

  static const _emptyLabels = [
    "No received package",
    "No new package",
  ];

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState(true);
    final _packages = useState(PackagesModel(packages: []));
    final _tabIndex = useState(0);

    void _fetchPackages() async {
      _isLoading.value = true;
      _packages.value =
          await PackageRepository().getPackageByResident(_tabIndex.value == 0);
      _isLoading.value = false;
    }

    useEffect(() {
      _fetchPackages();
    }, [_tabIndex.value]);

    return Column(
      children: [
        TextTab(
          labels: _tabs,
          onSelect: (i) {
            _tabIndex.value = i;
          },
          selectedIndex: _tabIndex.value,
        ),
        Expanded(
          child: _isLoading.value
              ? CenteredProgressIndicator()
              : _packages.value.packages.isEmpty
                  ? Column(
                      children: [
                        EmptyListDisplay(
                          text: _emptyLabels[_tabIndex.value],
                        ),
                      ],
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(kSizeS),
                      itemCount: _packages.value.packages.length,
                      itemBuilder: (context, index) {
                        final pk = _packages.value.packages[index];
                        return ResidentPackageCard(
                          postalService: pk.postalService,
                          arrivedAt: pk.arrivedAt,
                          imageUrl: pk.imgList[0],
                          deliveredAt:
                              _tabIndex.value == 0 ? pk.deliveredAt : null,
                        );
                      },
                    ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: kSizeXXS,
          ),
          color: kLightColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: "SHOW IDENTIFICATION",
                onPressed: () => Navigator.of(context).pushNamed(
                  ProfileCardScreen.routeName,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: kSizeXS,
                  horizontal: kSizeS,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
