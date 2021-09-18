import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/main_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sodales et lacus vel consequat. Duis ac sem id lorem congue mollis ac et turpis. Nulla ultrices tempus laoreet. Proin finibus tincidunt lobortis. Morbi cursus velit non dictum tincidunt. Nunc dignissim rutrum urna nec imperdiet. Fusce rhoncus ultrices tincidunt. Quisque ut lacus dolor.";

class ReplyScreen extends HookWidget {
  static const routeName = "/condo/reply";
  const ReplyScreen({Key? key}) : super(key: key);

  Widget _buildHeaderText(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3?.copyWith(
            color: kBlackColor,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _reply = useTextEditingController();

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

    void fetchReport() async {
      _isLoading.value = true;
      _report.value = await ReportRepository().getReport(_reportId);
      _isLoading.value = false;
    }

    useEffect(() {
      fetchReport();
    }, []);

    useEffect(() {}, [_report.value]);

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
                          _buildHeaderText(
                              context, "Reply to ${_report.value.reportOwner}"),
                          kSizedBoxVerticalS,
                          _buildHeaderText(context,
                              "Room number: ${_report.value.roomNumber}"),
                          kSizedBoxVerticalS,
                          _buildHeaderText(context, "Complaint Detail"),
                          kSizedBoxVerticalS,
                          Text(
                            _report.value.detail,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          kSizedBoxVerticalS,
                          kSizedBoxVerticalXS,
                          FormTextArea(
                            fieldName: "Reply",
                            minLine: 10,
                            maxLine: 15,
                            textEditingController: _reply,
                          ),
                          kSizedBoxVerticalS,
                          kSizedBoxVerticalXS,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                text: "MARK AS RESOLVED",
                                onPressed: () => print('Resolved'),
                                padding: EdgeInsets.symmetric(
                                  horizontal: kSizeM,
                                  vertical: kSizeXS,
                                ),
                              ),
                              kSizedBoxHorizontalS,
                              CustomButton(
                                text: "SUBMIT",
                                onPressed: () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                        MainScreen.routeName, (_) => false),
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
                  ],
                ),
              ),
      ),
    );
  }
}
