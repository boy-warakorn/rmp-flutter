import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_edit_screen.dart';
import 'package:rmp_flutter/widgets/general/alert_box.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/general/text_wall_display.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class PackageDetailScreen extends HookWidget {
  static const routeName = "/condo/package-detail";
  const PackageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final _isLoading = useState(true);
    final _package = useState(
      Package(
          id: "",
          roomNumber: "",
          roomOwner: "",
          note: "",
          arrivedAt: "",
          deliveredAt: "",
          status: "",
          postalService: ""),
    );

    void _deletePackage() async {
      await PackageRepository().deletePackage(id);
      Navigator.pop(context);
      Navigator.pop(context);
    }

    Future<void> _showAlertBox() async {
      return showDialog(
        context: context,
        builder: (ctx) => AlertBox(
          message: "Are you sure?",
          onNegative: () => Navigator.pop(context),
          onPositive: _deletePackage,
        ),
      );
    }

    void _fetchPackageInfo() async {
      _isLoading.value = true;
      _package.value = await PackageRepository().getPackage(id) as Package;
      _isLoading.value = false;
    }

    useEffect(() {
      _fetchPackageInfo();
    }, []);

    return Scaffold(
      appBar: BackAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kSizeS * 1.5,
          vertical: kSizeS,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CB2312",
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: kBlackColor,
                  ),
            ),
            kSizedBoxVerticalS,
            Text(
              "Owner: ${_package.value.roomOwner}",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: kFontSizeHeadline4,
                  ),
            ),
            kSizedBoxVerticalXS,
            Text(
              "Delivered By: ${_package.value.postalService}",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: kFontSizeHeadline4,
                  ),
            ),
            kSizedBoxVerticalXS,
            Text(
              "Arrival Date: ${_package.value.arrivedAt}",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: kFontSizeHeadline4,
                  ),
            ),
            kSizedBoxVerticalXS,
            Text(
              "Received By: Warakorn",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: kFontSizeHeadline4,
                  ),
            ),
            kSizedBoxVerticalXS,
            Text(
              "Received Date: ${_package.value.deliveredAt.isEmpty ? "-" : _package.value.deliveredAt}",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: kFontSizeHeadline4,
                  ),
            ),
            kSizedBoxVerticalXS,
            Text(
              "Status: ${_package.value.deliveredAt.isEmpty ? "Arrived" : "Delivered"}",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: kFontSizeHeadline4,
                  ),
            ),
            kSizedBoxVerticalXS,
            Text(
              "Note",
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: kBlackColor,
                  ),
            ),
            kSizedBoxVerticalS,
            Expanded(
                child: TextWallDisplay(
              text: _package.value.note,
            )),
            kSizedBoxVerticalL,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: kSizeXL,
                  child: CustomButton(
                    color: kErrorColor,
                    text: "DELETE",
                    onPressed: _showAlertBox,
                  ),
                ),
                kSizedBoxHorizontalS,
                Container(
                  width: kSizeXL,
                  child: CustomButton(
                    text: "EDIT",
                    onPressed: () => Navigator.of(context)
                        .pushNamed(PostalEditScreen.routeName, arguments: id).then((value) =>_fetchPackageInfo()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
