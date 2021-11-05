import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_result_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class RepairFormScreen extends HookWidget {
  static const routeName = "/resident/repair-form";
  const RepairFormScreen({Key? key}) : super(key: key);

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
              kSizedBoxVerticalS,
              Row(
                children: [
                  CustomText.sectionHeaderBlack(
                    "Upload Photos (Optional)",
                    context,
                  ),
                  kSizedBoxHorizontalXS,
                  IconButton(
                    splashRadius: kSizeS * 1.5,
                    icon: Icon(
                      Icons.cloud_upload_outlined,
                    ),
                    color: kBrandColor,
                    onPressed: () {
                      showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kSizeS),
                            topRight: Radius.circular(kSizeS),
                          ),
                        ),
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: CustomButton(
                                    text: "Take a photo",
                                    onPressed: () {
                                      print("photo here");
                                    },
                                    padding: EdgeInsets.symmetric(
                                      vertical: kSizeXS,
                                      horizontal: kSizeXS,
                                    ),
                                  ),
                                ),
                                kSizedBoxVerticalXS,
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: CustomButton(
                                    text: "Choose from gallery",
                                    onPressed: () {
                                      print("photo here");
                                    },
                                    color: kWarningColor,
                                    padding: EdgeInsets.symmetric(
                                      vertical: kSizeXS,
                                      horizontal: kSizeXS,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
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
