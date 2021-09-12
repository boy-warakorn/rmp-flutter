import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/widget_preview_screen.dart';

class FormTextField extends StatefulWidget {
  final String fieldName;
  final TextEditingController textEditingController;
  const FormTextField(
      {Key? key, required this.fieldName, required this.textEditingController})
      : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  void printText() {
    print("Text changed: ${widget.textEditingController.text}");
  }

  @override
  void initState() {
    widget.textEditingController.addListener(printText);
    super.initState();
  }

  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
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
          height: kSizeM,
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
