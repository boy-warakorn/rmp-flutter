import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class FormTextFieldIcon extends StatefulWidget {
  final String fieldName;
  final Icon icon;
  final TextEditingController textEditingController;
  final String rightSideText;

  const FormTextFieldIcon({
    Key? key,
    required this.fieldName,
    required this.icon,
    required this.textEditingController,
    required this.rightSideText,
  }) : super(key: key);

  @override
  State<FormTextFieldIcon> createState() => _FormTextFieldIconState();
}

class _FormTextFieldIconState extends State<FormTextFieldIcon> {
  void toggleObsecureText() {}

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
          height: kSizeL,
          child: TextFormField(
            controller: widget.textEditingController,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(),
                child: widget.icon,
              ),
              suffixIcon: GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: kSizeS,
                    horizontal: kSizeS,
                  ),
                  child: Text(
                    widget.rightSideText,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          foreground: Paint()..shader = kGradientColor,
                        ),
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: kBorderRadiusXS,
                borderSide: BorderSide(
                  color: kInputBorderColor,
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
            obscureText: false,
            validator: (value) {
              value == null || value.isEmpty
                  ? '${widget.fieldName} is required'
                  : null;
            },
          ),
        ),
      ],
    );
  }
}
