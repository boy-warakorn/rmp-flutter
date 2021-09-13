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
        Container(
          child: TextFormField(
            minLines: widget.minLine,
            maxLines: widget.maxLine,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: kBorderRadiusXS,
                borderSide: BorderSide(
                  color: kAlternativeColor,
                  width: kSizeXXXS / 2,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: kSizeXS,
                vertical: kSizeS / 1.7,
              ),
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
