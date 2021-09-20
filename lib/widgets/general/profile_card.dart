import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/profile_text.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(kSizeM),
      margin: EdgeInsets.all(kSizeM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            kStrokeColor,
            kBrandColor,
          ],
        ),
        borderRadius: kBorderRadiusS,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/129.png"),
          kSizedBoxHorizontalM,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: kLightColor,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "Anawat Paothong",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: kLightColor,
                      fontSize: kFontSizeHeadline3,
                    ),
              ),
              kSizedBoxVerticalS,
              Text(
                "ID",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: kLightColor,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "1100702921723",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: kLightColor,
                      fontSize: kFontSizeHeadline3,
                    ),
              ),
              kSizedBoxVerticalS,
              Text(
                "Phone number",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: kLightColor,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "0933264415",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: kLightColor,
                      fontSize: kFontSizeHeadline3,
                    ),
              ),
            ],
          ),
          kSizedBoxHorizontalM,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Room number",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: kLightColor,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "A0001",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: kLightColor,
                      fontSize: kFontSizeHeadline3,
                    ),
              ),
              kSizedBoxVerticalS,
              Text(
                "Moved in since",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: kLightColor,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "2020/9/19",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: kLightColor,
                      fontSize: kFontSizeHeadline3,
                    ),
              ),
              kSizedBoxVerticalS,
              Text(
                "Room expires",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: kLightColor,
                    ),
              ),
              kSizedBoxVerticalXS,
              Text(
                "2021/9/19",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: kLightColor,
                      fontSize: kFontSizeHeadline3,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
