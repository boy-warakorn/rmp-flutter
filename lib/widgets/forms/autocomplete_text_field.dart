import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class AutoCompleteTextField extends StatelessWidget {
  final BuildContext context;
  final TextEditingController textEditingController;
  final String? hintText;
  final List<String> optionList;
  final void Function(String)? onChanged;

  const AutoCompleteTextField(
    this.context, {
    Key? key,
    required this.textEditingController,
    this.hintText,
    required this.optionList,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      fieldViewBuilder: (context, controller, focusNode, onSubmitted) =>
          TextField(
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyText1,
        controller: controller,
        focusNode: focusNode,
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
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return optionList.where(
          (roomNum) => roomNum.toLowerCase().contains(
                textEditingValue.text.toLowerCase(),
              ),
        );
      },
    );
  }
}
