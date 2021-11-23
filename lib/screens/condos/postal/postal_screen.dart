import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/screens/condos/postal/package_detail_screen.dart';
import 'package:rmp_flutter/utils/date_format.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/empty_list_display.dart';
import 'package:rmp_flutter/widgets/general/package_card.dart';
import 'package:rmp_flutter/widgets/interactions/text_tab.dart';

class PostalScreen extends HookWidget {
  static const routeName = "/condo/postal";
  const PostalScreen({Key? key}) : super(key: key);

  static const _tabs = [
    "Received",
    "In-Storage",
  ];

  static const _emptyLabels = [
    "No received package",
    "No new package",
  ];

  @override
  Widget build(BuildContext context) {
    final _packages = useState(PackagesModel(packages: [], statusCount: {}));
    final _isLoading = useState(true);
    final _tabIndex = useState(0);

    List<String> generateTabLabel(){
      if(_packages.value.statusCount.isEmpty){
        return _tabs;
      }else {
        return [
          "Received (${_packages.value.statusCount["received"]})",
          "In Storage (${_packages.value.statusCount["inStorage"]})"
        ];
      }
    }

    void _fetchPackages() async {
      final packageStatus = _tabs[_tabIndex.value].toLowerCase();
      _isLoading.value = true;
      _packages.value = await PackageRepository().getPackages(packageStatus);
      _isLoading.value = false;
    }

    useEffect(() {
      _fetchPackages();
    }, [_tabIndex.value]);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            kBrandColor,
            kBrandAlternativeDarkerColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              kSizedBoxVerticalS,
              kSizedBoxVerticalXS,
              Container(
                padding: EdgeInsets.only(
                  left: kSizeS,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.layers,
                      size: kSizeS * 1.5,
                    ),
                    kSizedBoxHorizontalXS,
                    CustomText.sectionHeaderLight(
                      "Postal Management",
                      context,
                    ),
                  ],
                ),
              ),
              kSizedBoxVerticalS,
              kSizedBoxVerticalXS,
              TextTab(
                selectedIndex: _tabIndex.value,
                labels: generateTabLabel(),
                onSelect: (p0) {
                  _tabIndex.value = p0;
                },
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: kSizeS * 1.5,
                vertical: kSizeS,
              ),
              decoration: BoxDecoration(
                color: kBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _isLoading.value
                        ? CenteredProgressIndicator()
                        : _packages.value.packages.isEmpty
                            ? EmptyListDisplay(
                                text: _emptyLabels[_tabIndex.value],
                              )
                            : ListView.builder(
                                itemCount: _packages.value.packages.length,
                                itemBuilder: (ctx, index) {
                                  Package pk = _packages.value.packages[index];
                                  return PackageCard(
                                    title: pk.roomNumber,
                                    date: formattedDate(pk.arrivedAt),
                                    note: pk.note.isEmpty ? "-" : pk.note,
                                    onPressed: () => Navigator.of(context)
                                        .pushNamed(
                                            PackageDetailScreen.routeName,
                                            arguments: pk.id)
                                        .then((value) => _fetchPackages()),
                                  );
                                },
                              ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
