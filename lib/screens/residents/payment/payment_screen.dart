// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/payment.dart';
import 'package:rmp_flutter/repositories/payment_repository.dart';
import 'package:rmp_flutter/screens/residents/payment/specific_payment_screen.dart';
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

class PaymentScreen extends HookConsumerWidget {
  static const routeName = "/resident/payment";
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _payments = useState(PaymentModel(payments: []));

    final _isLoading = useState(false);

    void fetchPayment() async {
      _isLoading.value = true;
      _payments.value = await PaymentRepository().getPaymentByResident();
      _isLoading.value = false;
    }

    useEffect(() {
      fetchPayment();
    }, []);

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
                            Text(
                              "Recently Payment",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(
                                    color: kLightColor,
                                  ),
                            ),
                            kSizedBoxHorizontalS,
                            kSizedBoxVerticalXS,
                            Row(
                              children: [
                                Expanded(
                                  child: TitleCard(
                                    title: "Electricity",
                                    subtitle: "100 BAHT",
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
                                    subtitle: "1500 BAHT",
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
                                    subtitle: '3000 BAHT',
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
                                Text(
                                  "My Payment",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                kSizedBoxVerticalS,
                                kSizedBoxVerticalXS,
                                Expanded(
                                  child: _isLoading.value
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ListView.builder(
                                          itemCount:
                                              _payments.value.payments.length,
                                          itemBuilder: (context, index) {
                                            final _currentPayment =
                                                _payments.value.payments[index];
                                            final data = _dummyData[index];
                                            return PaymentCard(
                                              type: _currentPayment.type,
                                              amount: _currentPayment.amount
                                                  .toString(),
                                              paidDate:
                                                  _currentPayment.paidAt.isEmpty
                                                      ? "Not Paid"
                                                      : _currentPayment.paidAt,
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                SpecificPaymentScreen.routeName,
                                                arguments: _currentPayment,
                                              ),
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
