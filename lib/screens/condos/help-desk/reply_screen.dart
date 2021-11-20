import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/utils/report_daylist_extractor.dart';
import 'package:rmp_flutter/widgets/dialogs/resolve_issue_dialog.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/text_with_value.dart';
import 'package:rmp_flutter/widgets/interactions/attachment_list.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/interactions/week_day_selector.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ReplyScreen extends HookWidget {
  static const routeName = "/condo/reply";
  const ReplyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _reply = useTextEditingController();
    final _reportId = ModalRoute.of(context)?.settings.arguments as String;
    final _isLoading = useState(false);
    final _report = useState(Report.empty());

    final _resolveDetail = useTextEditingController();

    void fetchReport() async {
      _isLoading.value = true;
      _report.value = await ReportRepository().getReport(_reportId);
      _isLoading.value = false;
    }

    void _submitResolve() async {
      try {
        await ReportRepository().setResolvedOnReport(
          _reportId,
          ResolveReportDto(
            detail: _resolveDetail.text,
            resolveBy: "condos personnel",
          ),
        );
        Navigator.of(context)
            .popUntil(ModalRoute.withName(PreLoadingScreen.routeName));
      } catch (_) {}
    }

    void _showResolveDialog(BuildContext context) async {
      return showDialog(
        context: context,
        builder: (ctx) => ResolveIssueDialog(
          onDismiss: () => Navigator.of(context).pop(),
          onSubmit: () => _submitResolve(),
          controller: _resolveDetail,
        ),
      );
    }

    useEffect(() {
      fetchReport();
    }, []);

    useEffect(() {}, [_report.value]);

    Widget _buildAvailableDays() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.sectionHeaderBlack("Available day(s)", context),
          kSizedBoxVerticalS,
          WeekDaySelector(
            selectedDays:
                extractAvailableDaysFromString(_report.value.availableDay),
            onSelect: null,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: BackAppBar(),
      body: SafeArea(
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
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kSizeS * (24 / 16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.sectionHeaderBlack(
                            "Title: ${_report.value.title}",
                            context,
                          ),
                          kSizedBoxVerticalS,
                          CustomText.sectionHeaderBlack(
                            "Reply to ${_report.value.reportOwner}",
                            context,
                          ),
                          kSizedBoxVerticalS,
                          CustomText.sectionHeaderBlack(
                            "Room number: ${_report.value.roomNumber}",
                            context,
                          ),
                          kSizedBoxVerticalS,
                          CustomText.sectionHeaderBlack(
                            "${_report.value.type == 'complaint' ? 'Complaint' : 'Maintenance'} Detail",
                            context,
                          ),
                          kSizedBoxVerticalS,
                          Text(
                            _report.value.detail,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          kSizedBoxVerticalS,
                          if (_report.value.type == 'maintenance')
                            _buildAvailableDays(),
                          kSizedBoxVerticalS,
                          kSizedBoxVerticalXS,
                          CustomText.sectionHeaderBlack(
                            "Evidences",
                            context,
                          ),
                          kSizedBoxVerticalS,
                          AttachmentList(
                            imgSourceType: ImgSourceType.url,
                            imgSourceStrings: _report.value.imgList,
                          ),
                          kSizedBoxVerticalS,
                          kSizedBoxVerticalXS,
                          _report.value.respondDetail!.isEmpty
                              ? FormTextArea(
                                  fieldName: "Reply",
                                  minLine: 10,
                                  maxLine: 15,
                                  textEditingController: _reply,
                                )
                              : TextWithValue(
                                  head: "Reply Detail",
                                  detail: _report.value.respondDetail!,
                                ),
                          kSizedBoxVerticalS,
                          kSizedBoxVerticalXS,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                text: "MARK AS RESOLVED",
                                onPressed: () => _showResolveDialog(context),
                                padding: EdgeInsets.symmetric(
                                  horizontal: kSizeS * 1.5,
                                  vertical: kSizeXS,
                                ),
                              ),
                              _report.value.respondDetail!.isEmpty
                                  ? Row(
                                      children: [
                                        kSizedBoxHorizontalS,
                                        CustomButton(
                                          text: "SUBMIT",
                                          onPressed: () async {
                                            if (_reply.text.isEmpty) return;
                                            try {
                                              await ReportRepository()
                                                  .replyReport(
                                                _report.value.id,
                                                ReplyReportDto(
                                                  respondDetail: _reply.text,
                                                ),
                                              );
                                            } catch (_) {}
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    PreLoadingScreen.routeName,
                                                    (_) => false);
                                          },
                                          padding: EdgeInsets.symmetric(
                                            horizontal: kSizeS * 1.5,
                                            vertical: kSizeXS,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
