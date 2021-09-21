import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/profile_card.dart';
import 'package:rmp_flutter/widgets/general/profile_text.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ProfileCardScreen extends StatelessWidget {
  static const String routeName = "/resident/postal/profile-card";
  const ProfileCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        isGradient: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
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
            children: [
              Image.asset("assets/images/129.png"),
              kSizedBoxVerticalM,
              ProfileText(
                text: "Name",
              ),
              kSizedBoxVerticalXS,
              ProfileText(
                text: "Anawat Paothong",
                isBold: true,
              ),
              kSizedBoxVerticalS,
              ProfileText(
                text: "ID",
              ),
              kSizedBoxVerticalXS,
              ProfileText(
                text: "1100702921723",
                isBold: true,
              ),
              kSizedBoxVerticalS,
              ProfileText(
                text: "Phone",
              ),
              kSizedBoxVerticalXS,
              ProfileText(
                text: "0933264415",
                isBold: true,
              ),
              kSizedBoxVerticalS,
              ProfileText(
                text: "Room number",
              ),
              kSizedBoxVerticalXS,
              ProfileText(
                text: "A001",
                isBold: true,
              ),
              kSizedBoxVerticalS,
              ProfileText(
                text: "Moved in since",
              ),
              kSizedBoxVerticalXS,
              ProfileText(
                text: "2020/9/19",
                isBold: true,
              ),
              kSizedBoxVerticalS,
              ProfileText(
                text: "Room expires",
              ),
              kSizedBoxVerticalXS,
              ProfileText(
                text: "2021/9/19",
                isBold: true,
              ),
              kSizedBoxS,
            ],
          ),
        ),
      ),
    );
  }
}
