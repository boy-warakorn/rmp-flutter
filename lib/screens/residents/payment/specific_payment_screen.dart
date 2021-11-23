// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/payment.dart';
import 'package:rmp_flutter/screens/residents/payment/confirm_payment_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/interactions/card_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class SpecificPaymentScreen extends HookConsumerWidget {
  static const routeName = "/resident/specific-payment";
  const SpecificPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _payment = ModalRoute.of(context)?.settings.arguments as Payment;
    final _isLoading = useState(false);

    Future<void> getProofOfPaymentImage({required ImageSource source}) async {
      final ImagePicker _picker = ImagePicker();
      final XFile? slipPhoto = await _picker.pickImage(source: source);

      if (slipPhoto != null) {
        final image = File(slipPhoto.path);
        Navigator.of(context).pushNamed(ConfirmPaymentScreen.routeName,
            arguments: [image, _payment]);
      }
    }

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: BackAppBar(),
      body: SafeArea(
        child: _isLoading.value
            ? CenteredProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        kSizeS * (1.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.sectionHeader(
                            "Pay ${_payment.type}",
                            context,
                          ),
                          kSizedBoxVerticalS,
                          Text(
                            "Amount:  ${_payment.amount} BAHT",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: kSizeS,
                            ),
                            child: Divider(
                              color: kAlternativeColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText.sectionHeaderBlack(
                                "Upload proof of payment by",
                                context,
                              ),
                            ],
                          ),
                          kSizedBoxVerticalS,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CardButton(
                                        title: "Taking a photo",
                                        onPressed: () => getProofOfPaymentImage(
                                          source: ImageSource.camera,
                                        ),
                                        icon: Icons.camera_alt,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: kSizeS,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText.sectionHeaderBlack(
                                        "OR",
                                        context,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CardButton(
                                        title: "Gallery",
                                        onPressed: () => getProofOfPaymentImage(
                                          source: ImageSource.gallery,
                                        ),
                                        icon: Icons.collections,
                                        backgroundColor: kWarningColor,
                                        useGradientBackground: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
