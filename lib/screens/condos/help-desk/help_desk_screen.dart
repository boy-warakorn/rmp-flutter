import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/condos/help-desk/reply_screen.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/general/empty_list_display.dart';
import 'package:rmp_flutter/widgets/general/help_desk_card.dart';
import 'package:rmp_flutter/utils/date_format.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/interactions/text_tab.dart';

const _typeTabs = [
  "Complaint",
  "Maintenance",
];

class HelpDeskScreen extends HookConsumerWidget {
  static const routeName = "/condo/helpdesk";

  const HelpDeskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _typeTabIndex = useState(0);
    final _statusTabIndex = useState(0);

    final _reports = useState(ReportsModel(reports: [], statusCount: {}));
    final _isLoading = useState(false);

    void fetchReports() async {
      _isLoading.value = true;

      final reportType = _typeTabs[_typeTabIndex.value].toLowerCase();
      _reports.value = await ReportRepository()
          .getReportsByCondo(_statusTabIndex.value == 1, reportType);

      _isLoading.value = false;
    }

    useEffect(
      () {
        fetchReports();
      },
      [_statusTabIndex.value, _typeTabIndex.value],
    );

    List<String> generateTabLabel(){
      if(_reports.value.statusCount.isEmpty){
        return _typeTabs;
      }else {
        return [
          "Incoming (${_reports.value.statusCount["pending"]})",
          "Responded (${_reports.value.statusCount["responded"]})",
        ];
      }
    }

    return Column(
      children: [
        TextTab(
          labels: _typeTabs,
          selectedIndex: _typeTabIndex.value,
          onSelect: (i) {
            _typeTabIndex.value = i;
          },
          selectedColor: kBrandAlternativeDarkerColor,
        ),
        Expanded(
          child: Column(
            children: [
              TextTab.secondary(
                labels: generateTabLabel(),
                onSelect: (i) {
                  _statusTabIndex.value = i;
                },
                selectedIndex: _statusTabIndex.value,
              ),
              Expanded(
                child: _isLoading.value
                    ? CenteredProgressIndicator()
                    : _reports.value.reports.isEmpty
                        ? EmptyListDisplay(
                          text: _statusTabIndex.value == 0
                              ? "No incoming report"
                              : "No responded report",
                        )
                        : Padding(
                            padding: const EdgeInsets.all(
                              kSizeS * (24 / 16),
                            ),
                            child: ListView.builder(
                              itemCount: _reports.value.reports.length,
                              itemBuilder: (context, index) {
                                final _currentReport =
                                    _reports.value.reports[index];
                                return HelpDeskCard(
                                  owner: _currentReport.reportOwner,
                                  title: _currentReport.title,
                                  date: formattedDate(
                                      _currentReport.requestedDate),
                                  detail: _currentReport.detail,
                                  actionButton: CustomButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(ReplyScreen.routeName,
                                              arguments: _currentReport.id)
                                          .then((value) => fetchReports());
                                    },
                                    text: !(_statusTabIndex.value == 1)
                                        ? "Reply"
                                        : "See detail",
                                  ),
                                );
                              },
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
