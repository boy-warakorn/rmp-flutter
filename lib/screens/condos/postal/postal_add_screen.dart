import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class PostalAddScreen extends HookWidget {
  static const routeName = "/condo/postal-add";
  const PostalAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _roomNumber = useTextEditingController();
    final _owner = useTextEditingController();
    final _deliveredBy = useTextEditingController();
    final _deliveredDate = useTextEditingController();
    final _receivedBy = useTextEditingController();
    final _receiveDate = useTextEditingController();
    final _status = useTextEditingController();
    final _note = useTextEditingController();

    return Scaffold(
      appBar: BackAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kSizeS * 1.5,
          vertical: kSizeS,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: kSizeS * 1.5,
              vertical: kSizeS,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: kSizeXL,
                  ),
                  child: FormTextField(
                    fieldName: "Room number",
                    textEditingController: _roomNumber,
                  ),
                ),
                kSizedBoxVerticalS,
                FormTextField(
                  fieldName: "Owner",
                  textEditingController: _owner,
                ),
                kSizedBoxVerticalS,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: kSizeXL * 1.15,
                      child: FormTextField(
                        fieldName: "Delivered By",
                        textEditingController: _deliveredBy,
                      ),
                    ),
                    Container(
                      width: kSizeXL * 1.15,
                      child: FormTextField(
                        fieldName: "Delivered Date",
                        textEditingController: _deliveredDate,
                        suffixIcon: Icon(
                          Icons.date_range_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
                kSizedBoxVerticalS,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: kSizeXL * 1.15,
                      child: FormTextField(
                        fieldName: "Received By",
                        textEditingController: _receivedBy,
                      ),
                    ),
                    Container(
                      width: kSizeXL * 1.15,
                      child: FormTextField(
                        fieldName: "Received Date",
                        textEditingController: _receiveDate,
                        suffixIcon: Icon(
                          Icons.date_range_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
                kSizedBoxVerticalS,
                Container(
                  padding: EdgeInsets.only(
                    right: kSizeXL,
                  ),
                  child: FormTextField(
                    fieldName: "Status",
                    textEditingController: _status,
                  ),
                ),
                kSizedBoxVerticalS,
                FormTextArea(
                  fieldName: "Note",
                  textEditingController: _note,
                  minLine: 5,
                  maxLine: 10,
                ),
                kSizedBoxVerticalM,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: kSizeXL / 1.25,
                      child: CustomButton(
                        text: "CLEAR",
                        onPressed: () => print('CLEAR'),
                        color: kWarningColor,
                      ),
                    ),
                    kSizedBoxHorizontalS,
                    Container(
                      width: kSizeXL / 1.25,
                      child: CustomButton(
                        text: "ADD",
                        onPressed: () => print('ADD'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
