// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/screens/residents/postal/profile_card_screen.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/general/title_card.dart';

class ResidentPostalScreen extends HookWidget {
  static const routeName = "/resident/postal";
  const ResidentPostalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState(true);
    final _packages = useState(PackagesModel(packages: []));

    void _fetchPackages() async {
      _isLoading.value = true;
      _packages.value = await PackageRepository().getPackageByResident();
      _isLoading.value = false;
    }

    useEffect(() {
      _fetchPackages();
    }, []);

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
                                    subtitle: _packages.value.packages
                                        .where((e) => e.status == "delivered")
                                        .length
                                        .toString(),
                                    icon: Icon(
                                      Icons.ac_unit,
                                      color: kStrokeColor,
                                    ),
                                  ),
                                ),
                                kSizedBoxHorizontalS,
                                Expanded(
                                  child: TitleCard(
                                    title: "Storage",
                                    subtitle: _packages.value.packages
                                        .where((e) => e.status != "delivered")
                                        .length
                                        .toString(),
                                    icon: Icon(
                                      Icons.ac_unit,
                                      color: kErrorColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            kSizedBoxVerticalXS,
                            kSizedBoxVerticalS,
                            Text(
                              "All Packages",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(
                                    color: kLightColor,
                                  ),
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
                            padding: const EdgeInsets.only(
                              top: kSizeS * 1.5,
                              left: kSizeS * 1.5,
                              right: kSizeS * 1.5,
                              bottom: kSizeS,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _isLoading.value
                                      ? CenteredProgressIndicator()
                                      : ListView.builder(
                                          itemCount:
                                              _packages.value.packages.length,
                                          itemBuilder: (context, index) {
                                            final pk =
                                                _packages.value.packages[index];

                                            return EntityCard(
                                                onPressed: () {},
                                                title: pk.postalService,
                                                subtitle:
                                                    "Arrived ${pk.arrivedAt}",
                                                statusKey: pk.status);
                                          },
                                        ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomButton(
                                      text: "SHOW IDENTIFICATION",
                                      onPressed: () =>
                                          Navigator.of(context).pushNamed(
                                        ProfileCardScreen.routeName,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: kSizeXS,
                                        horizontal: kSizeS,
                                      ),
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
