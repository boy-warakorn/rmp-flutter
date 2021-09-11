import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class PackageCard extends StatelessWidget {
  final String title;
  final String date;
  final String note;
  final void Function() onPressed;

  const PackageCard({
    Key? key,
    required this.title,
    required this.date,
    required this.note,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        splashColor: kSubtitleColor,
        child: Padding(
          padding: EdgeInsets.all(kSizeS),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kSubtitleColor),  
                  ),
                ],
              ),
              kSizedBoxVerticalS,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      note,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
                    )
                  ),
                  kSizedBoxHorizontalS,
                  Icon(Icons.arrow_forward_ios, color: kStrokeColor,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}