import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/residents/contact-support/resident_reply_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ReportDetailScreen extends HookConsumerWidget {
  static const routeName = "/resident/report-detail";
  const ReportDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _reportId = ModalRoute.of(context)?.settings.arguments as String;
    final _isLoading = useState(false);
    final _report = useState(
      Report(
        id: "",
        roomNumber: "",
        reportOwner: "",
        requestedDate: "",
        resolvedDate: "",
        title: "",
        detail: "",
        status: "",
      ),
    );
    final _title = useTextEditingController();

    void fetchReport() async {
      _isLoading.value = true;
      _report.value = await ReportRepository().getReport(_reportId);
      _isLoading.value = false;
    }

    useEffect(() {
      fetchReport();
    }, []);

    useEffect(() {
      _title.text = _report.value.detail;
    }, [_report.value]);

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
                    FormTextArea(
                      fieldName: "Complaint Detail",
                      textEditingController: _title,
                      minLine: 10,
                      maxLine: 20,
                    ),
                    kSizedBoxVerticalM,
                    if (_report.value.respondDetail!.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            text: "See Reply",
                            onPressed: () => Navigator.of(context).pushNamed(
                              ResidentReplyScreen.routeName,
                              arguments: _report.value.respondDetail,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: kSizeS,
                              vertical: kSizeXS,
                            ),
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
