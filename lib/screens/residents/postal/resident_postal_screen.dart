// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/interactions/text_tab.dart';

const tabs = [
  "Received",
  "Not Received",
];

const dummyImgUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png";

class ResidentPostalScreen extends HookWidget {
  static const routeName = "/resident/postal";
  const ResidentPostalScreen({Key? key}) : super(key: key);

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
          labels: tabs,
          onSelect: (i) {
            _tabIndex.value = i;
          },
          selectedIndex: _tabIndex.value,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSizeS * (24 / 16),
            ),
            child: Column(
              children: [
                kSizedBoxVerticalS,
                kSizedBoxVerticalXS,
                kSizedBoxVerticalS,
                kSizedBoxHorizontalXS,
                _isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 180,
                            childAspectRatio: 1 / 1.5,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: kSizeS * 1.5,
                          ),
                          itemCount: _packages.value.packages.length,
                          itemBuilder: (context, index) {
                            final pk = _packages.value.packages[index];
                            return EntityCard(
                              title: pk.postalService,
                              onPressed: () {},
                              subtitle: "Arrived ${pk.arrivedAt}",
                              statusKey: pk.status,
                              imageUrl: dummyImgUrl,
                              isPostal: true,
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
