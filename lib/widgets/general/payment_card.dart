import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class PaymentCard extends StatelessWidget {
  final String type;
  final String amount;
  final String paidDate;
  final void Function() onPressed;

  const PaymentCard({
    Key? key,
    required this.type,
    required this.amount,
    required this.paidDate,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentStyle = Theme.of(context).textTheme.bodyText1;

    return CardTemplate(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(kSizeS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type: $type",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  kSizedBoxVerticalS,
                  Row(
                    children: [
                      Text("Amount: $amount", style: contentStyle),
                      const SizedBox(
                        width: kSizeM,
                      ),
                      Text(
                        "Paid date: $paidDate",
                        style: contentStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: kStrokeColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
