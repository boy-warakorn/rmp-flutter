import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/resident_reply_screen.dart';
import 'package:rmp_flutter/widgets/dialogs/abort_issue_dialog.dart';
import 'package:rmp_flutter/widgets/general/text_with_value.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ReportDetailScreen extends HookConsumerWidget {
  static const routeName = "/resident/report-detail";
  const ReportDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _reportId = ModalRoute.of(context)?.settings.arguments as String;
    final _isLoading = useState(false);
    final _report = useState(
      Report.empty(),
    );

    final _abortDetail = useTextEditingController();

    void _submitAbort() async {
      await ReportRepository().setResolvedOnReport(
        _reportId,
        ResolveReportDto(detail: _abortDetail.text, resolveBy: "resident"),
      );
      Navigator.of(context)
          .popUntil(ModalRoute.withName(PreLoadingScreen.routeName));
    }

    Future<void> _showAbortDialog(BuildContext context) async {
      return showDialog(
        context: context,
        builder: (ctx) => AbortIssueDialog(
          onDismiss: () => Navigator.of(context).pop(),
          onSubmit: () => _submitAbort(),
          controller: _abortDetail,
        ),
      );
    }

    void fetchReport() async {
      _isLoading.value = true;
      _report.value = await ReportRepository().getReport(_reportId);
      _isLoading.value = false;
    }

    useEffect(() {
      fetchReport();
    }, []);

    return Scaffold(
      appBar: BackAppBar(),
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: _isLoading.value
            ? Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.only(
                  left: kSizeS * 1.5,
                  right: kSizeS * 1.5,
                  top: kSizeS,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: kBlackColor,
                          ),
                    ),
                    kSizedBoxVerticalS,
                    Text(
                      _report.value.title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    kSizedBoxVerticalS,
                    TextWithValue(
                      head: "Issue Detail",
                      detail: _report.value.detail,
                    ),
                    kSizedBoxVerticalM,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (_report.value.status != "resolved")
                          CustomButton(
                            text: "Abort Issue",
                            onPressed: () => _showAbortDialog(context),
                            color: kErrorColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: kSizeS * 1.5,
                              vertical: kSizeXS,
                            ),
                          ),
                        kSizedBoxHorizontalXS,
                        if (_report.value.respondDetail!.isNotEmpty)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                text: "See Reply",
                                onPressed: () =>
                                    Navigator.of(context).pushNamed(
                                  ResidentReplyScreen.routeName,
                                  arguments: _report.value.respondDetail,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: kSizeS * 1.5,
                                  vertical: kSizeXS,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
