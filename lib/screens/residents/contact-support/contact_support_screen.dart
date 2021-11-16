import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/residents/contact-support/report_detail_screen.dart';
import 'package:rmp_flutter/utils/date_format.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/interactions/text_tab.dart';

class ContactSupportScreen extends HookConsumerWidget {
  static const routeName = "/resident/contact-support";
  const ContactSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _reports = useState(ReportsModel(reports: []));
    final _isLoading = useState(false);
    final List<String> _items = ["Responded", "Pending", "Resolved"];
    final _tabIndex = useState(0);

    void fetchReports() async {
      final reportStatus = _items[_tabIndex.value].toLowerCase();
      _isLoading.value = true;
      _reports.value =
          await ReportRepository().getReportsByResident(reportStatus);
      _isLoading.value = false;
    }

    useEffect(() {
      fetchReports();
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
          Container(
            padding: EdgeInsets.only(
              left: kSizeS * 1.5,
              top: kSizeS * 1.5,
              bottom: kSizeS,
            ),
            child: Column(
              children: [
                CustomText.sectionHeaderLight(
                  "Contact Support",
                  context,
                ),
                kSizedBoxVerticalS,
              ],
            ),
          ),
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(
              //   kSizeS * 1.5,
              // ),
              decoration: BoxDecoration(
                color: kBgColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    kSizeS,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextTab(
                    labels: _items,
                    selectedIndex: _tabIndex.value,
                    onSelect: (p0){
                      _tabIndex.value = p0;
                    },
                  ),
                  kSizedBoxVerticalS,
                  _isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: _reports.value.reports.length,
                            itemBuilder: (ctx, index) {
                              final _currentReport =
                                  _reports.value.reports[index];

                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: kSizeS * 1.5,
                                ),
                                child: EntityCard(
                                  title: _currentReport.title,
                                  subtitle:
                                      "Requested Date: ${formattedDate(_currentReport.requestedDate)}",
                                  statusKey: _currentReport.status,
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(ReportDetailScreen.routeName,
                                          arguments: _currentReport.id)
                                      .then((value) => fetchReports()),
                                ),
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
