import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';

class AbortIssueDialog extends HookWidget {
  final void Function() onDismiss;
  final void Function() onSubmit;
  final TextEditingController controller;

  const AbortIssueDialog({
    Key? key,
    required this.onDismiss,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  Widget _buildActionButton({
    required bool isSubmit,
    required void Function() onPressed,
  }) {
    return CustomButton(
      onPressed: onPressed,
      text: isSubmit ? "Abort" : "Close",
      color: isSubmit ? kErrorColor : kBlackColor,
      isDominant: isSubmit,
      padding:
          const EdgeInsets.symmetric(vertical: kSizeXS, horizontal: kSizeM),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Abort this issue",
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: kBlackColor,
                ),
          ),
          kSizedBoxVerticalXS,
          kSizedBoxVerticalXXS,
          Text(
            "Reason",
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: kFontSizeBody1,
                ),
          ),
          kSizedBoxVerticalXS,
          kSizedBoxVerticalXXS,
          TextFormField(
            maxLines: 4,
            controller: controller,
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
              hintText: "Your reason",
              hintStyle: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          kSizedBoxVerticalXS,
          kSizedBoxVerticalXXS,
          Text(
            "By aborting this issue, you will no longer get any response related to this issue. Proceed?",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: kErrorColor),
          ),
          kSizedBoxVerticalXS,
          kSizedBoxVerticalXXS,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton(
                isSubmit: false,
                onPressed: onDismiss,
              ),
              kSizedBoxHorizontalS,
              _buildActionButton(
                isSubmit: true,
                onPressed: onSubmit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
