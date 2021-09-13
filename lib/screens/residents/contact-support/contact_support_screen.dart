import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/entity_card.dart';
import 'package:rmp_flutter/widgets/general/entity_card_status.dart';

class ContactSupportScreen extends StatelessWidget {
  static const routeName = "/resident/contact-support";
  const ContactSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.symmetric(
              horizontal: kSizeS * 1.5,
              vertical: kSizeS,
            ),
            child: Column(
              children: [
                Text(
                  "Contact Support",
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: kLightColor,
                      ),
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
                  Text(
                    "All Reports",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: kFontSizeHeadline3,
                          color: kBrandDarkerColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  kSizedBoxVerticalXS,
                  kSizedBoxVerticalS,
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, index) => EntityCard(
                        title: "This is title",
                        date: "13/9/2021",
                        entityStatus: EntityCardStatus(
                          text: "Recieved",
                          color: kSuccessColor,
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
    );
  }
}
