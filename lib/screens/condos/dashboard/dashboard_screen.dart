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
    final _packages = useState(PackagesModel.empty());
    final _reports = useState(ReportsModel.empty());
    final _isLoading = useState(true);

    void fetchData() async {
      _isLoading.value = true;
      _packages.value = await PackageRepository().getAllPackages();
      _reports.value = await ReportRepository().getAllReports();
      _isLoading.value = false;
    }

    useEffect(() {
      fetchData();
    }, []);

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
                        title: "In-storage",
                        subtitle:
                            _packages.value.statusCount["inStorage"].toString(),
                      ),
                      rightCard: TitleCard(
                        title: "Delivered",
                        subtitle:
                            _packages.value.statusCount["received"].toString(),
                      ),
                    ),
                    kSizedBoxVerticalM,
                    _buildTitleCardGroup(
                      context,
                      header: "Residential Report",
                      leftCard: TitleCard(
                        title: "Incoming",
                        subtitle:
                            _reports.value.statusCount["pending"].toString(),
                      ),
                      rightCard: TitleCard(
                        title: "Responded",
                        subtitle:
                            _reports.value.statusCount["responded"].toString(),
                      ),
                    ),
                    kSizedBoxVerticalS,
                  ],
                ),
        ),
      ),
    );
  }
}
