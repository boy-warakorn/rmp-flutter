import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/condos/help-desk/reply_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/general/custom_slider.dart';
import 'package:rmp_flutter/widgets/general/help_desk_card.dart';
import 'package:rmp_flutter/utils/date_format.dart';

class HelpDeskScreen extends HookConsumerWidget {
  static const routeName = "/condo/helpdesk";

  const HelpDeskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isResponded = useState(true);

    final _reports = useState(ReportsModel(reports: []));
    final _isLoading = useState(false);

    void fetchReports() async {
      _isLoading.value = true;
      _reports.value =
          await ReportRepository().getReportsByCondo(_isResponded.value);
      _isLoading.value = false;
    }

    useEffect(() {
      fetchReports();
    }, []);

    void switchResponded(bool switchTo) {
      _isResponded.value = switchTo;
    }

    useEffect(
      () {
        fetchReports();
      },
      [_isResponded.value],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kSizeS * (24 / 16),
      ),
      child: Column(
        children: [
          kSizedBoxVerticalS,
          kSizedBoxVerticalXS,
          CustomSlider(
            isResponded: _isResponded.value,
            onValueChanged: (switchTo) => switchResponded(switchTo),
          ),
          kSizedBoxVerticalS,
          kSizedBoxHorizontalXS,
          _isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
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
                          text: !_isResponded.value ? "Reply" : "See detail",
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
