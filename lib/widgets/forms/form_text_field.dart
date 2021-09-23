import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class FormTextField extends StatefulWidget {
  final String fieldName;
  final TextEditingController textEditingController;
  final Icon? suffixIcon;

  const FormTextField({
    Key? key,
    required this.fieldName,
    required this.textEditingController,
    this.suffixIcon,
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
          height: kSizeM,
          child: TextFormField(
            controller: widget.textEditingController,
            decoration: InputDecoration(
              filled: true,
              fillColor: kLightColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: kBorderRadiusM,
                borderSide: BorderSide(
                  color: kInputBorderColor,
                  width: kSizeXXXS / 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: kBorderRadiusM,
                borderSide: BorderSide(
                  color: kInputBorderColor,
                  width: kSizeXXXS / 2,
                ),
              ),
              focusColor: kInputBorderColor,
              contentPadding: EdgeInsets.symmetric(
                horizontal: kSizeS,
                vertical: kSizeS / 1.7,
              ),
              suffixIcon: widget.suffixIcon,
              hintText: widget.fieldName,
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
