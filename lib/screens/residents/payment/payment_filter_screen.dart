import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/payment.dart';
import 'package:rmp_flutter/repositories/payment_repository.dart';
import 'package:rmp_flutter/screens/residents/payment/specific_payment_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/payment_card.dart';
import 'package:rmp_flutter/widgets/interactions/text_tab.dart';

class PaymentFilterScreen extends HookWidget {
  static const routeName = "/resident/payment-filter";
  const PaymentFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _payments = useState(PaymentModel(payments: []));
    final _isLoading = useState(false);
    final _tabIndex = useState(0);

    final List<String> _item = [
      "Complete",
      "Pending",
      "Active",
    ];

    void fetchPayment() async {
      final paymentStatus = _item[_tabIndex.value].toLowerCase();

      _isLoading.value = true;
      _payments.value = await PaymentRepository().getPaymentByStatus(paymentStatus);
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
          TextTab(
            selectedIndex: _tabIndex.value,
            labels: _item,
            onSelect: (p0) {
              _tabIndex.value = p0;
            },
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(
                kSizeS * 1.5,
              ),
              decoration: BoxDecoration(
                color: kBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
