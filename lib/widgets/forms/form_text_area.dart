import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class FormTextArea extends StatefulWidget {
  final String fieldName;
  final TextEditingController textEditingController;
  final int minLine;
  final int maxLine;

  const FormTextArea({
    Key? key,
    required this.fieldName,
    required this.textEditingController,
    required this.minLine,
    required this.maxLine,
  }) : super(key: key);

  @override
  _FormTextAreaState createState() => _FormTextAreaState();
}

class _FormTextAreaState extends State<FormTextArea> {
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
        kSizedBoxVerticalS,
        TextFormField(
            minLines: widget.minLine,
            maxLines: widget.maxLine,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kInputBorderColor,
                ),
              ),
              filled: true,
              fillColor: kLightColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: kBorderRadiusXS,
                borderSide: BorderSide(
                  color: kInputBorderColor,
                  width: 0,
                ),
              ),
              contentPadding: EdgeInsets.all(
                kSizeS,
              ),
              hintText: widget.fieldName,
              hintStyle: Theme.of(context).textTheme.subtitle1,
            ),
            validator: (value) {
              value == null || value.isEmpty ? 'Input is required' : null;
            }),
      ],
    );
  }
}
