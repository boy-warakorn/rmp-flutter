import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';

class BrandTitle extends StatelessWidget {
  final Image brandLogo;
  final String brandTitle;
  const BrandTitle({
    Key? key,
    required this.brandLogo,
    required this.brandTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: brandLogo,
      title: Text(
        brandTitle,
        style: Theme.of(context).textTheme.headline4?.copyWith(
              color: kBrandTitleColor,
            ),
      ),
    );
  }
}
