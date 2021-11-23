import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/layout/card_template.dart';

class ResidentPackageCard extends StatelessWidget {
  const ResidentPackageCard({
    Key? key,
    required this.imageUrl,
    required this.postalService,
    required this.arrivedAt,
    this.deliveredAt,
  }) : super(key: key);

  final String? imageUrl;
  final String postalService;
  final String arrivedAt;
  final String? deliveredAt;

  Widget _buildInfo(BuildContext context,
      {required String label, required String value}) {
    return Column(
      children: [
        CustomText(label),
        kSizedBoxVerticalXXS,
        CustomText(
          value,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kAlternativeColor,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: AspectRatio(
              aspectRatio: 1,
              child: imageUrl == null
                  ? FittedBox(
                      fit: BoxFit.fill,
                      child: Icon(
                        Icons.all_inbox_rounded,
                        color: kAlternativeColor,
                      ),
                    )
                  : Image.network(
                      imageUrl!,
                      loadingBuilder: (ctx, widget, progress) {
                        if (progress == null) {
                          return widget;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: progress.expectedTotalBytes != null
                                ? progress.cumulativeBytesLoaded /
                                    progress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
            ),
          ),
          kSizedBoxHorizontalS,
          Expanded(
            flex: 3,
            child: Column(
              children: [
                CustomText(
                  postalService,
                  style: Theme.of(context).textTheme.headline4,
                ),
                kSizedBoxVerticalS,
                _buildInfo(context, label: "Arrival Time", value: arrivedAt),
                if (deliveredAt != null) kSizedBoxVerticalS,
                if (deliveredAt != null)
                  _buildInfo(
                    context,
                    label: "Delivery time",
                    value: deliveredAt!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
