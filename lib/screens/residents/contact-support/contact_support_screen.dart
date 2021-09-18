import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/residents/contact-support/report_detail_screen.dart';
import 'package:rmp_flutter/utils/date_format.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/general/entity_card_status.dart';

class ContactSupportScreen extends HookConsumerWidget {
  static const routeName = "/resident/contact-support";
  const ContactSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _reports = useState(ReportsModel(reports: []));
    final _isLoading = useState(false);

    void fetchReports() async {
      _isLoading.value = true;
      _reports.value = await ReportRepository().getReportsByResident();
      _isLoading.value = false;
    }

    useEffect(() {
      fetchReports();
    }, []);

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
                Text(
                  "Contact Support",
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: kLightColor,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(
                kSizeS * 1.5,
              ),
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
                  Text(
                    "All Reports",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: kFontSizeHeadline3,
                          color: kBrandDarkerColor,
                          fontWeight: FontWeight.bold,
                        ),
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

                              return EntityCard(
                                title: _currentReport.title,
                                subtitle:
                                    "Requested Date: ${formattedDate(_currentReport.requestedDate)}",
                                statusKey: _currentReport.status,
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(ReportDetailScreen.routeName,
                                        arguments: _currentReport.id),
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
