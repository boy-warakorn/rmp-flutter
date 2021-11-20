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
import 'package:rmp_flutter/widgets/general/empty_list_display.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/interactions/text_tab.dart';

class ContactSupportScreen extends HookConsumerWidget {
  static const routeName = "/resident/contact-support";
  const ContactSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _reports = useState(ReportsModel(reports: []));
    final _isLoading = useState(false);
    final List<String> _items = [
      "Responded",
      "Pending",
      "Resolved",
    ];
    final List<String> _complaintAndMaintenance = [
      "Complaint",
      "Maintenance",
    ];
    final _emptyLabels = [
      "No responded issue",
      "No pending issue",
      "No resolved issue",
    ];
    final _bottomTabIndex = useState(0);
    final _topTabIndex = useState(0);

    void fetchReports() async {
      final reportStatus = _items[_bottomTabIndex.value].toLowerCase();
      final reportType =
          _complaintAndMaintenance[_topTabIndex.value].toLowerCase();
      _isLoading.value = true;
      _reports.value =
          await ReportRepository().getReportsByResident(reportStatus, reportType);
      _isLoading.value = false;
    }

    useEffect(() {
      fetchReports();
    }, [
      _bottomTabIndex.value,
      _topTabIndex.value,
    ]);

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
              left: kSizeS,
              top: kSizeS * 1.5,
              bottom: kSizeS,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: kSizeS * 1.5,
                    ),
                    kSizedBoxHorizontalXS,
                    CustomText.sectionHeaderLight(
                      "Contact Support",
                      context,
                    ),
                  ],
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
                    labels: _complaintAndMaintenance,
                    selectedIndex: _topTabIndex.value,
                    onSelect: (p0) {
                      _topTabIndex.value = p0;
                    },
                    selectedColor: kBrandAlternativeDarkerColor,
                  ),
                  TextTab(
                    labels: _items,
                    selectedIndex: _bottomTabIndex.value,
                    onSelect: (p0) {
                      _bottomTabIndex.value = p0;
                    },
                    verticalPadding: kSizeXS * 1.5,
                    selectedColor: kStrokeColor,
                    underlineHeight: 2.5,
                  ),
                  kSizedBoxVerticalS,
                  _isLoading.value
                      ? Expanded(
                        child: Center(
                            child: CircularProgressIndicator(),
                          ),
                      )
                      : _reports.value.reports.isEmpty
                          ? EmptyListDisplay(
                              text: _emptyLabels[_bottomTabIndex.value],
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
                                          .pushNamed(
                                              ReportDetailScreen.routeName,
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
