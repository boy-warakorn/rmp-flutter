import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_add_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_edit_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class PackageDetailScreen extends HookWidget {
  static const routeName = "/condo/package-detail";
  const PackageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _note = useTextEditingController();
    return Scaffold(
      appBar: BackAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kSizeS * 1.5,
          vertical: kSizeS,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CB2312",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: kBlackColor,
                    ),
              ),
              kSizedBoxVerticalS,
              Text(
                "Owner: Anawat Paothong",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: kFontSizeHeadline4,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "Delivered By: Thailand Postal",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: kFontSizeHeadline4,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "Arrival Date: 4/3/2021",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: kFontSizeHeadline4,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "Received By: Warakorn",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: kFontSizeHeadline4,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "Received Date: 4/3/2021",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: kFontSizeHeadline4,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "Status: Arrived",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: kFontSizeHeadline4,
                    ),
              ),
              kSizedBoxVerticalXS,
              FormTextArea(
                fieldName: "Note",
                textEditingController: _note,
                minLine: 10,
                maxLine: 20,
              ),
              kSizedBoxVerticalL,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: kSizeXL,
                    child: CustomButton(
                      text: "EDIT",
                      onPressed: () => Navigator.of(context)
                          .pushNamed(PostalEditScreen.routeName),
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
