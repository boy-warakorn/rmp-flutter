import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class ResidentReplyScreen extends HookWidget {
  static const routeName = "/resident/report-reply";
  const ResidentReplyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _respondDetail = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: BackAppBar(),
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: kSizeS * 1.5,
            right: kSizeS * 1.5,
            top: kSizeS,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reply Detail',
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: kBlackColor,
                    ),
              ),
              kSizedBoxVerticalM,
              Container(
                width: MediaQuery.of(context).size.width,
                height: kSizeXXL,
                padding: EdgeInsets.all(kSizeS),
                color: kLightColor,
                child: Text(
                  _respondDetail,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
