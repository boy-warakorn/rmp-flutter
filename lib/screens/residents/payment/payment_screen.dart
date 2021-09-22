// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/screens/residents/payment/specific_payment_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/payment_card.dart';
import 'package:rmp_flutter/widgets/general/title_card.dart';

const _dummyData = [
  {
    "type": "Pay1",
    "amount": 50,
    "date": "20/02/2002",
  },
  {
    "type": "Pay2",
    "amount": 5000,
    "date": "20/02/2002",
  },
  {
    "type": "Pay3",
    "amount": 4500,
    "date": "20/02/2002",
  },
  {
    "type": "Pay4",
    "amount": 50000,
    "date": "20/02/2002",
  },
  {
    "type": "Pay5",
    "amount": 50500,
    "date": "20/02/2002",
  },
];

class PaymentScreen extends StatelessWidget {
  static const routeName = "/resident/payment";
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: const <Color>[
                        kBrandColor,
                        kBrandAlternativeDarkerColor,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      kSizedBoxHorizontalS,
                      kSizedBoxHorizontalXS,
                      kSizedBoxVerticalXXS,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kSizeS * (24 / 16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.sectionHeaderLight(
                              "Recent Payment",
                              context,
                            ),
                            kSizedBoxHorizontalS,
                            kSizedBoxVerticalXS,
                            Row(
                              children: [
                                Expanded(
                                  child: TitleCard(
                                    title: "Electricity",
                                    subtitle: "\$100",
                                    icon: Icon(
                                      Icons.bolt,
                                      color: kWarningColor,
                                    ),
                                  ),
                                ),
                                kSizedBoxHorizontalS,
                                Expanded(
                                  child: TitleCard(
                                    title: "Water",
                                    subtitle: "\$1500",
                                    icon: Icon(
                                      Icons.water_damage_outlined,
                                      color: kStrokeColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            kSizedBoxVerticalXS,
                            Row(
                              children: [
                                Expanded(
                                  child: TitleCard(
                                    icon: Icon(
                                      Icons.payment,
                                      color: kSuccessColor,
                                    ),
                                    title: "Common Charge",
                                    subtitle: '\$500',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      kSizedBoxVerticalS,
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: kLightColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kSizeS),
                              topRight: Radius.circular(kSizeS),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(kSizeS * 1.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText.sectionHeader(
                                  "My Payment",
                                  context,
                                ),
                                kSizedBoxVerticalS,
                                kSizedBoxVerticalXS,
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      final data = _dummyData[index];
                                      return PaymentCard(
                                        type: "${data['type']}",
                                        amount: "${data['amount']}",
                                        paidDate: "${data['date']}",
                                        onPressed: () => Navigator.of(context)
                                            .pushNamed(SpecificPaymentScreen
                                                .routeName),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
