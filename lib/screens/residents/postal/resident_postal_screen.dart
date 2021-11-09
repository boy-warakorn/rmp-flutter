// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/interactions/custom_slider.dart';

class ResidentPostalScreen extends HookWidget {
  static const routeName = "/resident/postal";
  const ResidentPostalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState(true);
    final _packages = useState(PackagesModel(packages: []));
    final _isReceived = useState(true);
    String imageUrl =
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png";

    void _fetchPackages() async {
      _isLoading.value = true;
      _packages.value =
          await PackageRepository().getPackageByResident(_isReceived.value);
      _isLoading.value = false;
    }

    useEffect(() {
      _fetchPackages();
    }, [_isReceived.value]);

    void switchResponded(bool switchTo) {
      _isReceived.value = switchTo;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kSizeS * (24 / 16),
      ),
      child: Column(
        children: [
          kSizedBoxVerticalS,
          kSizedBoxVerticalXS,
          CustomSlider(
            isResponded: _isReceived.value,
            onValueChanged: (switchTo) => switchResponded(switchTo),
            primaryText: "Received",
            secondaryText: "Not Received",
          ),
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
                        imageUrl: imageUrl,
                        isPostal: true,
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
