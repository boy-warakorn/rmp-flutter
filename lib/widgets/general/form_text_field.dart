import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/widget_preview_screen.dart';

class FormTextField extends StatefulWidget {
  final String fieldName;
  const FormTextField({Key? key, required this.fieldName}) : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  final formTextField = TextEditingController();

  void printText() {
    print("Text changed: ${formTextField.text}");
  }

  @override
  void dispose() {
    formTextField.dispose();
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
            controller: formTextField,
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
