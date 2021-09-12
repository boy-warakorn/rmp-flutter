import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';

class AlertBox extends StatelessWidget {
  final String message;
  final void Function() onNegative;
  final void Function() onPositive;

  const AlertBox({
    Key? key,
    required this.message,
    required this.onNegative,
    required this.onPositive,
  }) : super(key: key);

  Widget _buildActionButton({
    required bool isPositive,
    required void Function() onPressed,
  }) {
    return Container(
      child: CustomButton(
        onPressed: onPressed,
        text: isPositive ? "Yes" : "No",
        color: isPositive ? kSuccessColor : kErrorColor,
        padding: const EdgeInsets.symmetric(
          vertical: kSizeXS,
          horizontal: kSizeM,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: kBlackColor,
                ),
          ),
        ],
      ),
      content: Container(
        height: kSizeM,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(
              isPositive: false,
              onPressed: onNegative,
            ),
            kSizedBoxHorizontalS,
            _buildActionButton(
              isPositive: true,
              onPressed: onPositive,
            ),
          ],
        ),
      ),
    );
  }
}
