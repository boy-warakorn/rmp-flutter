import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/payment.dart';
import 'package:rmp_flutter/repositories/payment_repository.dart';
import 'package:rmp_flutter/screens/residents/payment/specific_payment_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/empty_list_display.dart';
import 'package:rmp_flutter/widgets/general/payment_card.dart';
import 'package:rmp_flutter/widgets/interactions/text_tab.dart';

class PaymentFilterScreen extends HookWidget {
  static const routeName = "/resident/payment-filter";
  const PaymentFilterScreen({Key? key}) : super(key: key);

  static const _tabs = [
    "Complete",
    "Pending",
    "Active",
  ];

  static const _emptyLabels = [
    "No completed payment",
    "No pending payment",
    "No active payment",
  ];

  @override
  Widget build(BuildContext context) {
    final _payments = useState(PaymentModel(payments: []));
    final _isLoading = useState(false);
    final _tabIndex = useState(0);

    final List<String> _item = [
      "Complete",
      "Pending",
      "Active",
      "Rejected",
    ];

    void fetchPayment() async {
      final paymentStatus = _tabs[_tabIndex.value].toLowerCase();

      _isLoading.value = true;
      _payments.value =
          await PaymentRepository().getPaymentByStatus(paymentStatus);
      _isLoading.value = false;
    }

    useEffect(() {
      fetchPayment();
    }, [_tabIndex.value]);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            kBrandColor,
            kBrandAlternativeDarkerColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kSizeS * 1.5,
              top: kSizeS * 1.5,
              bottom: kSizeS,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.sectionHeaderLight(
                  "Your Payment",
                  context,
                ),
                kSizedBoxVerticalS,
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextTab(
                    selectedIndex: _tabIndex.value,
                    labels: _tabs,
                    onSelect: (p0) {
                      _tabIndex.value = p0;
                    },
                  ),
                  kSizedBoxVerticalS,
                  _tabIndex.value == 3
                      ? Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kSizeS * 1.5,
                          ),
                          child: Text(
                            "If your payment status notify you as 'rejected', you will have to contact to condo personnel.",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: kErrorColor,
                                    ),
                          ),
                        )
                      : Container(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kSizeS * 1.5,
                        vertical: kSizeS,
                      ),
                      child: _isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : _payments.value.payments.isEmpty
                              ? EmptyListDisplay(
                                  text: _emptyLabels[_tabIndex.value],
                                )
                              : ListView.builder(
                                  itemCount: _payments.value.payments.length,
                                  itemBuilder: (context, index) {
                                    final _currentPayment =
                                        _payments.value.payments[index];
                                    return PaymentCard(
                                      type: _currentPayment.type,
                                      amount: _currentPayment.amount.toString(),
                                      paidDate: _currentPayment.paidAt.isEmpty
                                          ? "-"
                                          : _currentPayment.paidAt,
                                      status: _currentPayment.status,
                                      onPressed: () =>
                                          Navigator.of(context).pushNamed(
                                        SpecificPaymentScreen.routeName,
                                        arguments: _currentPayment,
                                      ),
                                    );
                                  },
                                ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
