import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/configs/week_days.dart';
import 'package:rmp_flutter/enums/user_interface_image_source.dart';
import 'package:rmp_flutter/repositories/report_repository.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_result_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/interactions/attachment_list.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/interactions/text_tab.dart';
import 'package:rmp_flutter/widgets/interactions/week_day_checkbox.dart';
import 'package:rmp_flutter/widgets/interactions/week_day_selector.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

// complaint / maintenance

const _typeKeys = [
  "complaint",
  "maintenance",
];

const _tabs = [
  "Complaint",
  "Maintenance",
];

class ContactFormScreen extends HookWidget {
  static const routeName = "/resident/contact-form";
  const ContactFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _title = useTextEditingController();
    final _detail = useTextEditingController();
    final _selectedDays = useState(<WeekDay>[]);
    final _tabIndex = useState(0);
    final _files = useState(<XFile>[]);

    final _isLoading = useState(false);
    final List<String> _listOfUrl = [];

    void selectDay(WeekDay day) {
      var tmp = <WeekDay>[];
      for (WeekDay d in _selectedDays.value) {
        tmp.add(d);
      }

      if (tmp.contains(day)) {
        tmp.removeWhere((d) => d == day);
      } else {
        tmp.add(day);
      }

      _selectedDays.value = tmp;
    }

    void removeAttachment(int index) {
      var tmp = <XFile>[];
      for (int i = 0; i < _files.value.length; i++) {
        if (i != index) {
          tmp.add(_files.value[i]);
        }
      }

      _files.value = tmp;
    }

    List<String> extractImgSourceStrings() {
      var result = <String>[];
      for (XFile file in _files.value) {
        result.add(file.path);
      }

      return result;
    }

    Widget _buildDaySelector() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.sectionHeaderBlack(
            "Day available for appointment",
            context,
          ),
          kSizedBoxVerticalS,
          if (_tabIndex.value == 1)
            WeekDaySelector(
              selectedDays: _selectedDays.value,
              onSelect: selectDay,
            ),
          kSizedBoxVerticalS,
        ],
      );
    }

    Future<void> _openGallery() async {
      final ImagePicker _picker = ImagePicker();
      final List<XFile>? pickedFileList = await _picker.pickMultiImage();
      try {
        if (pickedFileList != null) {
          _files.value = pickedFileList;
        }
      } catch (e) {
        print(e.toString());
      }
    }

    Future<void> sendReport() async {
      if (_title.text.isEmpty || _detail.text.isEmpty && _files.value.isEmpty) {
        return;
      }
      try {
        _isLoading.value = true;
        for (int i = 0; i < _files.value.length; i++) {
          final _fileName = basename(_files.value[i].path);
          final storageRef =
              FirebaseStorage.instance.ref().child('evidences/$_fileName');
          await storageRef.putFile(File(_files.value[i].path));
          final url = await storageRef.getDownloadURL();
          _listOfUrl.add(url.toString());
        }

        var _dayStrings = <String>[];
        for (WeekDay day in _selectedDays.value) {
          _dayStrings.add(dayName[day]!);
        }

        await ReportRepository().createReport(
          CreateReportDto(
            detail: _detail.text,
            title: _title.text,
            imgList: _listOfUrl,
            type: _typeKeys[_tabIndex.value],
            dayList: _tabIndex.value == 0 ? [] : _dayStrings,
          ),
        );
        _isLoading.value = false;
      } catch (_) {
        print("Failed to send report");
      }
      Navigator.of(context).pushNamed(ContactResultScreen.routeName);
    }

    return Scaffold(
      appBar: BackAppBar(
        isGradient: true,
      ),
      backgroundColor: kBgColor,
      body: _isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                TextTab(
                  selectedIndex: _tabIndex.value,
                  labels: _tabs,
                  onSelect: (i) {
                    _tabIndex.value = i;
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
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
                          if (_tabIndex.value == 1) _buildDaySelector(),
                          FormTextArea(
                            fieldName: "${_tabs[_tabIndex.value]} Detail",
                            textEditingController: _detail,
                            minLine: 10,
                            maxLine: 20,
                          ),
                          kSizedBoxVerticalS,
                          Row(
                            children: [
                              CustomText.sectionHeaderBlack(
                                "Attachments (Optional)",
                                context,
                              ),
                              kSizedBoxHorizontalXS,
                              IconButton(
                                splashRadius: kSizeS * 1.5,
                                icon: Icon(
                                  Icons.cloud_upload_outlined,
                                ),
                                color: kBrandColor,
                                onPressed: () => _openGallery(),
                              ),
                            ],
                          ),
                          kSizedBoxVerticalS,
                          _files.value.isNotEmpty
                              ? AttachmentList(
                                  imgSourceStrings: extractImgSourceStrings(),
                                  imgSourceType: UserInterfaceImageSource.filePath,
                                  removable: true,
                                  onRemove: removeAttachment,
                                )
                              : Container(),
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
                                    _files.value = [];
                                    _selectedDays.value = [];
                                  },
                                  color: kWarningColor,
                                ),
                              ),
                              kSizedBoxHorizontalS,
                              Container(
                                width: kSizeXL / 1.25,
                                child: CustomButton(
                                  text: "SEND",
                                  onPressed: sendReport,
                                ),
                              ),
                            ],
                          ),
                          kSizedBoxVerticalM,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
