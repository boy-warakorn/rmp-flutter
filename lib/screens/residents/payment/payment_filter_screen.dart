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
    "Overdue",
    "Complete",
    "Pending",
    "Active",
    "Rejected",
  ];

  static const _emptyLabels = [
    "No overdue payment",
    "No completed payment",
    "No pending payment",
    "No active payment",
    "No rejected payment",
  ];

  @override
  Widget build(BuildContext context) {
    final _payments = useState(PaymentModel(payments: [], statusCount: {}));
    final _isLoading = useState(false);
    final _tabIndex = useState(0);

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

    List<String> generateTabLabel() {
      if (_payments.value.statusCount.isEmpty) {
        return _tabs;
      } else {
        return [
          "Overdue (${_payments.value.statusCount["overdue"]})",
          "Complete (${_payments.value.statusCount["complete"]})",
          "Pending (${_payments.value.statusCount["pending"]})",
          "Active (${_payments.value.statusCount["active"]})",
          "Reject (${_payments.value.statusCount["reject"]})",
        ];
      }
    }

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
              left: kSizeS,
              top: kSizeS * 1.5,
              bottom: kSizeS,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.credit_card,
                      size: kSizeS * 1.5,
                    ),
                    kSizedBoxHorizontalXS,
                    CustomText.sectionHeaderLight(
                      "Your Payment",
                      context,
                    ),
                  ],
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
                    labels: generateTabLabel(),
                    onSelect: (p0) {
                      _tabIndex.value = p0;
                    },
                  ),
                  _tabIndex.value == 0 && _payments.value.payments.isNotEmpty
                      ? _isLoading.value
                          ? Container()
                          : Container(
                              padding: EdgeInsets.only(
                                left: kSizeS * 1.5,
                                right: kSizeS * 1.5,
                                top: kSizeS,
                              ),
                              child: Text(
                                "Please contact to condo's personnel to extend time for payment.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: kErrorColor,
                                    ),
                              ),
                            )
                      : Container(),
                  _tabIndex.value == 4 && _payments.value.payments.isNotEmpty
                      ? _isLoading.value
                          ? Container()
                          : Container(
                              padding: EdgeInsets.only(
                                left: kSizeS * 1.5,
                                right: kSizeS * 1.5,
                                top: kSizeS,
                              ),
                              child: Text(
                                "If your payment status notify you as 'rejected', you will have to contact to condo personnel.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: kErrorColor,
                                    ),
                              ),
                            )
                      : Container(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kSizeS * 1.5,
                        vertical: kSizeS * 1.5,
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
                                      dueDate: _currentPayment.duedAt,
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
