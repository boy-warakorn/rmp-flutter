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
      color: kBgColor,
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
                      ],
                    ),
                  ),
                  kSizedBoxHorizontalXS,
                  if (paidDate == "-")
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: kStrokeColor,
                    )
                ],
              ),
              kSizedBoxVerticalS,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: status == "complete"
                            ? kSuccessColor
                            : status == "pending"
                                ? kWarningColor
                                : kErrorColor,
                        width: kSizeXXXS,
                      ),
                      borderRadius: kBorderRadiusL,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kSizeXS, horizontal: kSizeM),
                      child: Text(
                        status,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: kSizeS * 0.85,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
