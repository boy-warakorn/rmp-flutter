// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/payment.dart';
import 'package:rmp_flutter/screens/residents/payment/specific_payment_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/payment_card.dart';
import 'package:rmp_flutter/widgets/general/title_card.dart';

class PaymentScreen extends HookConsumerWidget {
  static const routeName = "/resident/payment";
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _payments = useState(PaymentModel(payments: []));

    final _isLoading = useState(false);

    void fetchPayment() async {
      _isLoading.value = true;
      // _payments.value = await PaymentRepository().getPaymentByResident();
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
                            CustomText.sectionHeaderLight(
                              "Recent Payment",
                              context,
                            ),
                            kSizedBoxHorizontalS,
                            kSizedBoxVerticalXS,
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: TitleCard(
                            //         title: "Electricity",
                            //         subtitle: "1000 Baht",
                            //         icon: Icon(
                            //           Icons.bolt,
                            //           color: kWarningColor,
                            //         ),
                            //       ),
                            //     ),
                            //     kSizedBoxHorizontalS,
                            //     Expanded(
                            //       child: TitleCard(
                            //         title: "Water",
                            //         subtitle: "150 Baht",
                            //         icon: Icon(
                            //           Icons.water_damage_outlined,
                            //           color: kStrokeColor,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
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
                                    subtitle: '3000 Baht',
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
                                            return PaymentCard(
                                              type: _currentPayment.type,
                                              amount: _currentPayment.amount
                                                  .toString(),
                                              paidDate:
                                                  _currentPayment.paidAt.isEmpty
                                                      ? "-"
                                                      : _currentPayment.paidAt,
                                              status: _currentPayment.status,
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
