import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class FormTextFieldIcon extends HookWidget {
  final String fieldName;
  final Icon icon;
  final TextEditingController textEditingController;
  final String suffixText;
  final Color fieldColor;
  final bool isPassword;

  const FormTextFieldIcon({
    Key? key,
    required this.fieldName,
    this.icon = const Icon(
      null,
      size: 0,
    ),
    required this.textEditingController,
    this.suffixText = '',
    this.fieldColor = kBlackColor,
    this.isPassword = false,
  }) : super(key: key);

  void printText() {
    print("Text changed: ${textEditingController.text}");
  }

  @override
  Widget build(BuildContext context) {
    final _isObscured = useState(false);

    toggleObsecureText() {
      _isObscured.value = !_isObscured.value;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                color: fieldColor == '' ? kBlackColor : fieldColor,
              ),
        ),
        kSizedBoxVerticalXS,
        Container(
          height: kSizeL,
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              prefixIcon: icon.icon != null ? icon : null,
              suffixIcon: GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: kSizeS,
                    horizontal: kSizeS,
                  ),
                  child: Text(
                    suffixText == '' ? '' : suffixText,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: kBrandColor,
                        ),
                  ),
                ),
                onTap: toggleObsecureText,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: kBorderRadiusXS,
              ),
              focusColor: kInputBorderColor,
              contentPadding: EdgeInsets.symmetric(
                horizontal: kSizeXS,
                vertical: kSizeS / 1.7,
              ),
              hintText: "Enter ${fieldName}",
              hintStyle: Theme.of(context).textTheme.subtitle1,
            ),
            obscureText: isPassword ? !_isObscured.value : _isObscured.value,
            validator: (value) {
              value == null || value.isEmpty
                  ? '${fieldName} is required'
                  : null;
            },
          ),
        ),
      ],
    );
  }
}
