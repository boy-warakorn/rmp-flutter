import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_result_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ContactFormScreen extends HookWidget {
  static const routeName = "/resident/contact-form";
  const ContactFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _title = useTextEditingController();
    final _detail = useTextEditingController();
    List<Asset> _images = <Asset>[];
    String _error = 'No Error';

    Future<void> _takePhoto() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? slipPhoto =
          await _picker.pickImage(source: ImageSource.camera);
      final _image = File(slipPhoto!.path);
      print(_image);
      // Navigator.of(context)
      //     .pushNamed(ContactResultScreen.routeName, arguments: [
      //   _image,
      // ]);
    }

    Future<void> _openGallery() async {
      List<Asset> resultList = <Asset>[];
      try {
        resultList = await MultiImagePicker.pickImages(
          maxImages: 300,
          enableCamera: true,
          selectedAssets: _images,
          cupertinoOptions: CupertinoOptions(
            takePhotoIcon: "chat",
            doneButtonTitle: "Fatto",
          ),
          materialOptions: MaterialOptions(
            actionBarColor: "#abcdef",
            actionBarTitle: "Example App",
            allViewTitle: "All Photos",
            useDetailsView: false,
            selectCircleStrokeColor: "#000000",
          ),
        );
      } on Exception catch (e) {
        print("Error is " + e.toString());
      }
    }

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
                                    onPressed: _takePhoto,
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
                                    onPressed: _openGallery,
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
