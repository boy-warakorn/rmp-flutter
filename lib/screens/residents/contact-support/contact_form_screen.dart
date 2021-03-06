import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_result_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ContactFormScreen extends HookWidget {
  static const routeName = "/resident/contact-form";
  const ContactFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _title = useTextEditingController();
    final _detail = useTextEditingController();

    return Scaffold(
      appBar: BackAppBar(),
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: kSizeS * 1.5,
            right: kSizeS * 1.5,
            top: kSizeS * 1.75,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTextField(
                fieldName: "Title",
                textEditingController: _title,
              ),
              kSizedBoxVerticalS,
              FormTextArea(
                fieldName: "Complaint Detail",
                textEditingController: _detail,
                minLine: 10,
                maxLine: 20,
              ),
              kSizedBoxVerticalL,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: kSizeXL / 1.25,
                    child: CustomButton(
                      text: "CLEAR",
                      onPressed: () {
                        _title.text = "";
                        _detail.text = "";
                      },
                      color: kWarningColor,
                    ),
                  ),
                  kSizedBoxHorizontalS,
                  Container(
                    width: kSizeXL / 1.25,
                    child: CustomButton(
                      text: "SEND",
                      onPressed: () async {
                        if (_title.text.isEmpty || _detail.text.isEmpty) return;
                        try {
                          await ReportRepository().createReport(
                            CreateReportDto(
                              detail: _detail.text,
                              title: _title.text,
                            ),
                          );
                        } catch (_) {}

                        Navigator.of(context)
                            .pushNamed(ContactResultScreen.routeName);
                      },
                    ),
                  ),
                ],
              ),
              kSizedBoxVerticalM,
            ],
          ),
        ),
      ),
    );
  }
}
