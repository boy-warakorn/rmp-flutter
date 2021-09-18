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

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ornare accumsan nulla non accumsan. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam eget pharetra lacus. Maecenas et dolor blandit, sodales justo pharetra,";

const dummy = [
  {
    "title": "T1",
    "date": "20/20/2202",
    "detail": loremIpsum,
    "isResponded": true,
  },
  {
    "title": "T2",
    "date": "20/20/2202",
    "detail": loremIpsum,
    "isResponded": false,
  },
  {
    "title": "T3",
    "date": "20/20/2202",
    "detail": loremIpsum,
    "isResponded": true,
  },
];

class HelpDeskScreen extends HookConsumerWidget {
  static const routeName = "/condo/helpdesk";

  const HelpDeskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isResponded = useState(false);

    final _reports = useState(ReportsModel(reports: []));
    final _isLoading = useState(false);
    const String _filter = "pending";

    void fetchReports() async {
      _isLoading.value = true;
      _reports.value = await ReportRepository().getAllReports(_filter);
      _isLoading.value = false;
    }

    useEffect(() {
      fetchReports();
    }, []);

    void switchResponded(bool switchTo) {
      _isResponded.value = switchTo;
      print(_isResponded.value);
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
                        title: _currentReport.title,
                        date: formattedDate(_currentReport.requestedDate),
                        detail: _currentReport.detail,
                        actionButton: !_isResponded.value
                            ? CustomButton(
                                onPressed: () =>
                                    Navigator.of(context).pushNamed(
                                  ReplyScreen.routeName,
                                  arguments: _currentReport.id,
                                ),
                                text: "REPLY",
                              )
                            : Container(),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
