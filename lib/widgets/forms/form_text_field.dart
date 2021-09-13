import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/widget_preview_screen.dart';

class FormTextField extends StatefulWidget {
  final String fieldName;
  final TextEditingController textEditingController;

  const FormTextField({
    Key? key,
    required this.fieldName,
    required this.textEditingController,
  }) : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  void printText() {
    print("Text changed: ${widget.textEditingController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                color: kBlackColor,
              ),
        ),
        kSizedBoxVerticalXS,
        Container(
          child: TextFormField(
            controller: widget.textEditingController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: kBorderRadiusM,
                borderSide: BorderSide(
                  color: kAlternativeColor,
                  width: kSizeXXXS,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: kSizeXS,
                vertical: kSizeS / 1.7,
              ),
              hintText: "Enter ${widget.fieldName}",
              hintStyle: Theme.of(context).textTheme.subtitle1,
            ),
            validator: (value) {
              value == null || value.isEmpty ? 'Input is required' : null;
            },
          ),
        ),
      ],
    );
  }
}