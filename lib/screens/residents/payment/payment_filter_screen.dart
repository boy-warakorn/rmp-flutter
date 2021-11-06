import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/general/payment_card.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';

class PaymentFilterScreen extends HookWidget {
  static const routeName = "/resident/payment-filter";
  const PaymentFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isDominant = useState(false);
    final _isCompleted = useState(false);
    final _isPending = useState(false);
    final _isActive = useState(true);

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
                      text: "Complete (4)",
                      onPressed: () {
                        _isCompleted.value = !_isCompleted.value;
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: kSizeS * 1.25,
                        vertical: kSizeXS,
                      ),
                      isDominant: _isCompleted.value,
                      color: kSuccessColor,
                    ),
                    kSizedBoxHorizontalS,
                    CustomButton(
                      text: "Pending (2)",
                      onPressed: () {
                        _isPending.value = !_isPending.value;
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: kSizeS * 1.25,
                        vertical: kSizeXS,
                      ),
                      isDominant: _isPending.value,
                      color: kWarningColor,
                    ),
                    kSizedBoxHorizontalS,
                    CustomButton(
                      text: "Active (3)",
                      onPressed: () {
                        _isActive.value = !_isActive.value;
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: kSizeS * 1.25,
                        vertical: kSizeXS,
                      ),
                      isDominant: _isActive.value,
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
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (ctx, index) {
                        return PaymentCard(
                          type: "Test",
                          amount: "1000",
                          status: "-",
                          paidDate: "1/1/2021",
                          onPressed: () => {
                            print('Hello'),
                          },
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
