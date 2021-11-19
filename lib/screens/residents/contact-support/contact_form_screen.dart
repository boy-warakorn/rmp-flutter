// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
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

const _tabs = [
  "Complaint",
  "Maintenance",
];

const _dummyUrl = [
  "https://www.ikea.com/th/en/images/products/djungelskog-soft-toy-panda__0877971_pe662366_s5.jpg?f=xl",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/330px-Grosser_Panda.JPG",
  "https://files.worldwildlife.org/wwfcmsprod/images/Panda_in_Tree/hero_small/99i33zyc0l_Large_WW170579.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Panda_Cub_from_Wolong%2C_Sichuan%2C_China.JPG/800px-Panda_Cub_from_Wolong%2C_Sichuan%2C_China.JPG",
  "https://images.theconversation.com/files/430483/original/file-20211105-9897-18ahqx2.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop",
];

class ContactFormScreen extends HookWidget {
  static const routeName = "/resident/contact-form";
  const ContactFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _title = useTextEditingController();
    final _detail = useTextEditingController();
    final _selectedDays = useState(<WeekDay>[
      WeekDay.sunday,
      WeekDay.monday,
      WeekDay.tuesday,
      WeekDay.wednesday,
      WeekDay.thursday,
      WeekDay.friday,
      WeekDay.saturday,
    ]);
    final _tabIndex = useState(0);

    List<Asset> images = <Asset>[];

    void selectDay(WeekDay day) {
      List<WeekDay> tmp = [];
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

    Widget _buildDaySelector() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.sectionHeaderBlack(
              "Day available for appointment", context),
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
      List<Asset> resultList = <Asset>[];
      try {
        resultList = await MultiImagePicker.pickImages(
          maxImages: 20,
          enableCamera: true,
          selectedAssets: images,
          materialOptions: MaterialOptions(
            actionBarColor: "#3A49F8",
            actionBarTitle: "Choose from Gallery",
            allViewTitle: "All Photos",
            useDetailsView: false,
            selectCircleStrokeColor: "#000000",
          ),
        );
        images = resultList;
        for (int i = 0; i < images.length; i++) {
          print(images[i].name! + " ");
        }
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: BackAppBar(
        isGradient: true,
      ),
      backgroundColor: kBgColor,
      body: Column(
        children: [
          TextTab(
            labels: _tabs,
            selectedIndex: _tabIndex.value,
            onSelect: (i) {
              _tabIndex.value = i;
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(
                  kSizeS * 1.5,
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
                          onPressed: () => _openGallery(),
                        ),
                      ],
                    ),
                    kSizedBoxVerticalS,
                    AttachmentList(
                      imgUrlList: _dummyUrl,
                      onSelect: (i) => print(i),
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
                              if (_title.text.isEmpty || _detail.text.isEmpty)
                                return;
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
          ),
        ],
      ),
    );
  }
}
