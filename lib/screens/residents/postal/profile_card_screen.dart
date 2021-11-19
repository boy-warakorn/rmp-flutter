import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/providers/user_provider.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/profile_text.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ProfileCardScreen extends HookConsumerWidget {
  static const String routeName = "/resident/postal/profile-card";
  const ProfileCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _name = ref.read(currentUser).user.name;
    final _phoneNumber = ref.read(currentUser).user.phoneNumber;
    final _citizenNumber = ref.read(currentUser).user.citizenNumber;

    return Scaffold(
      appBar: BackAppBar(
        isGradient: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: kBgColor,
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/images/man-avatar.png",
                width: 250,
                height: 250,
              ),
              CustomText.sectionHeaderBlack(_name, context),
              kSizedBoxVerticalXXS,
              CustomText.sectionHeaderBlack("A001", context),
              kSizedBoxVerticalS,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileText(
                    text: "Name",
                  ),
                  kSizedBoxVerticalXS,
                  ProfileText(
                    text: _name,
                    isBold: true,
                  ),
                  Divider(
                    height: kSizeXS,
                    thickness: 1,
                    indent: kSizeS * 1.5,
                    endIndent: kSizeS * 1.25,
                  ),
                  kSizedBoxVerticalS,
                  ProfileText(
                    text: "ID",
                  ),
                  kSizedBoxVerticalXS,
                  ProfileText(
                    text: _citizenNumber,
                    isBold: true,
                  ),
                  Divider(
                    height: kSizeXS,
                    thickness: 1,
                    indent: kSizeS * 1.5,
                    endIndent: kSizeS * 1.25,
                  ),
                  kSizedBoxVerticalS,
                  ProfileText(
                    text: "Phone number",
                  ),
                  kSizedBoxVerticalXS,
                  ProfileText(
                    text: _phoneNumber,
                    isBold: true,
                  ),
                  Divider(
                    height: kSizeXS,
                    thickness: 1,
                    indent: kSizeS * 1.5,
                    endIndent: kSizeS * 1.25,
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
                  Divider(
                    height: kSizeXS,
                    thickness: 1,
                    indent: kSizeS * 1.5,
                    endIndent: kSizeS * 1.25,
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
                  Divider(
                    height: kSizeXS,
                    thickness: 1,
                    indent: kSizeS * 1.5,
                    endIndent: kSizeS * 1.25,
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
                  Divider(
                    height: kSizeXS,
                    thickness: 1,
                    indent: kSizeS * 1.5,
                    endIndent: kSizeS * 1.25,
                  ),
                ],
              ),
              kSizedBoxVerticalL,
            ],
          ),
        ),
      ),
    );
  }
}
