import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/payment.dart';
import 'package:rmp_flutter/repositories/payment_repository.dart';
import 'package:rmp_flutter/screens/residents/payment/specific_payment_screen.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/payment_card.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';

class PaymentFilterScreen extends HookWidget {
  static const routeName = "/resident/payment-filter";
  const PaymentFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _payments = useState(PaymentModel(payments: []));
    final _isLoading = useState(false);
    final _changeStatus = useState([false, true, true]);
    const String _complete = "complete";
    const String _pending = "pending";
    const String _active = "active";

    void fetchPayment(String status) async {
      _isLoading.value = true;
      _payments.value = await PaymentRepository().filterPaymentByStatus(status);
      _isLoading.value = false;
    }

    useEffect(() {
      fetchPayment("complete");
    }, []);

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
                  "Filter",
                  context,
                ),
                kSizedBoxVerticalS,
                kSizedBoxVerticalXS,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomButton(
                      text: "Complete",
                      onPressed: () {
                        _changeStatus.value[0] = !_changeStatus.value[0];
                        _changeStatus.value[1] = true;
                        _changeStatus.value[2] = true;
                        fetchPayment(_complete);
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: kSizeS * 1.25,
                        vertical: kSizeXS,
                      ),
                      isDominant: _changeStatus.value[0],
                      color: kSuccessColor,
                    ),
                    kSizedBoxHorizontalS,
                    CustomButton(
                      text: "Pending",
                      onPressed: () {
                        _changeStatus.value[1] = !_changeStatus.value[1];
                        _changeStatus.value[0] = true;
                        _changeStatus.value[2] = true;
                        fetchPayment(_pending);
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: kSizeS * 1.25,
                        vertical: kSizeXS,
                      ),
                      isDominant: _changeStatus.value[1],
                      color: kWarningColor,
                    ),
                    kSizedBoxHorizontalS,
                    CustomButton(
                      text: "Active",
                      onPressed: () {
                        _changeStatus.value[2] = !_changeStatus.value[2];
                        _changeStatus.value[0] = true;
                        _changeStatus.value[1] = true;
                        fetchPayment(_active);
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: kSizeS * 1.25,
                        vertical: kSizeXS,
                      ),
                      isDominant: _changeStatus.value[2],
                      color: kErrorColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(
                kSizeS * 1.5,
              ),
              decoration: BoxDecoration(
                color: kBgColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    kSizeS,
                  ),
                ),
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
