import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/condos/help-desk/reply_screen.dart';
import 'package:rmp_flutter/widgets/general/help_desk_card.dart';
import 'package:rmp_flutter/utils/date_format.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/interactions/text_tab.dart';

class HelpDeskScreen extends HookConsumerWidget {
  static const routeName = "/condo/helpdesk";

  const HelpDeskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tabIndex = useState(0);
    final _reports = useState(ReportsModel(reports: []));
    final _isLoading = useState(false);

    void fetchReports() async {
      _isLoading.value = true;
      _reports.value =
          await ReportRepository().getReportsByCondo(_tabIndex.value == 1);
      _isLoading.value = false;
    }

    useEffect(
      () {
        fetchReports();
      },
      [_tabIndex.value],
    );

    return Column(
      children: [
        TextTab(
          labels: [
            "Incoming",
            "Responded",
          ],
          selectedIndex: _tabIndex.value,
          onSelect: (i) {
            _tabIndex.value = i;
          },
        ),
        Expanded(
          child: _isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(
                    kSizeS * (24 / 16),
                  ),
                  child: ListView.builder(
                    itemCount: _reports.value.reports.length,
                    itemBuilder: (context, index) {
                      final _currentReport = _reports.value.reports[index];
                      return HelpDeskCard(
                        owner: _currentReport.reportOwner,
                        title: _currentReport.title,
                        date: formattedDate(_currentReport.requestedDate),
                        detail: _currentReport.detail,
                        actionButton: CustomButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(ReplyScreen.routeName,
                                    arguments: _currentReport.id)
                                .then((value) => fetchReports());
                          },
                          text:
                              !(_tabIndex.value == 1) ? "Reply" : "See detail",
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
