import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ReportDetailScreen extends HookWidget {
  static final routeName = "/resident/report-detail";
  const ReportDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _title = useTextEditingController(
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    );
    String dummyText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Posuere urna, cras parturient venenatis porttitor platea. Auctor amet ultricies libero lectus convallis urna, lacinia.';

    return Scaffold(
      appBar: BackAppBar(),
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: Container(
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
                dummyText,
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
            ],
          ),
        ),
      ),
    );
  }
}
