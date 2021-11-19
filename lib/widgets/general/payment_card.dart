import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class PaymentCard extends StatelessWidget {
  final String type;
  final String amount;
  final String paidDate;
  final String status;
  final void Function() onPressed;

  const PaymentCard(
      {Key? key,
      required this.type,
      required this.amount,
      required this.paidDate,
      required this.onPressed,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentStyle = Theme.of(context).textTheme.bodyText1;

    return CardTemplate(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: paidDate == "-" ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.all(kSizeS),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Type: $type",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        kSizedBoxVerticalS,
                        Text("Amount: $amount", style: contentStyle),
                        kSizedBoxVerticalXS,
                        Text(
                          "Paid date: $paidDate",
                          style: contentStyle,
                        ),
                        kSizedBoxVerticalXS,
                        Row(
                          children: [
                            Text(
                              "Status: ",
                              style: contentStyle,
                            ),
                            Text(
                              status,
                              style: contentStyle?.copyWith(
                                color: status == "complete"
                                    ? kSuccessColor
                                    : status == "pending"
                                        ? kWarningColor
                                        : status == "active"
                                            ? kBrandColor
                                            : kErrorColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (paidDate == "-")
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: kStrokeColor,
                    )
                ],
              ),
              kSizedBoxVerticalXXS,
            ],
          ),
        ),
      ),
    );
  }
}
