import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/widgets/general/title_card.dart';

class DashboardScreen extends HookWidget {
  static const routeName = "/condo/dashboard";

  const DashboardScreen({Key? key}) : super(key: key);

  Widget _buildTitleCardGroup(
    BuildContext context, {
    required String header,
    required TitleCard leftCard,
    required TitleCard rightCard,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: Theme.of(context).textTheme.headline3,
        ),
        kSizedBoxVerticalS,
        Row(
          children: [
            Expanded(
              child: leftCard,
            ),
            const SizedBox(
              width: kSizeXS,
            ),
            Expanded(
              child: rightCard,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _packagesTotal = useState(PackagesModel(packages: []));
    final _packagesReceived = useState(PackagesModel(packages: []));
    final _isLoading = useState(false);
    final _reportsResponded = useState(ReportsModel(reports: []));
    final _reportsPending = useState(ReportsModel(reports: []));
    final _isResponded = useState(true);

    void fetchData() async {
      _isLoading.value = true;
      _packagesTotal.value =
          await PackageRepository().getPackages("in-storage");
      _reportsResponded.value =
          await ReportRepository().getReportsByCondo(_isResponded.value);
      _reportsPending.value =
          await ReportRepository().getReportsByCondo(!_isResponded.value);
      _packagesReceived.value =
          await PackageRepository().getPackageByResident(!_isResponded.value);
      _isLoading.value = false;
    }

    // useEffect(() {
    //   fetchData();
    // });

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            kSizeS * (24 / 16),
          ),
          child: _isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    _buildTitleCardGroup(
                      context,
                      header: "Postal Package",
                      leftCard: TitleCard(
                        title: "Received",
                        subtitle:
                            _packagesReceived.value.packages.length.toString(),
                      ),
                      rightCard: TitleCard(
                        title: "Total",
                        subtitle:
                            _packagesTotal.value.packages.length.toString(),
                      ),
                    ),
                    kSizedBoxVerticalM,
                    _buildTitleCardGroup(
                      context,
                      header: "Residential Report",
                      leftCard: TitleCard(
                        title: "Unread",
                        subtitle:
                            _reportsPending.value.reports.length.toString(),
                      ),
                      rightCard: TitleCard(
                        title: "Replied",
                        subtitle:
                            _reportsResponded.value.reports.length.toString(),
                      ),
                    ),
                    kSizedBoxVerticalS,
                    // CardTemplate(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    // Text(
                    //   "All Reports",
                    //   style: Theme.of(context).textTheme.headline4,
                    // ),
                    // kSizedBoxVerticalS,
                    // kSizedBoxVerticalXS,
                    // SummaryEntity(
                    //   text: "Summ",
                    //   count: 1,
                    // ),
                    // SummaryEntity(
                    //   text: "Summ",
                    //   count: 9,
                    // ),
                    // SummaryEntity(
                    //   text: "Summ",
                    //   count: 10,
                    // ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
        ),
      ),
    );
  }
}
