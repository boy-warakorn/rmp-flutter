import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_edit_screen.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/widgets/dialogs/alert_box.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/general/text_wall_display.dart';
import 'package:rmp_flutter/widgets/interactions/circle_icon_button.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class PackageDetailScreen extends HookWidget {
  static const routeName = "/condo/package-detail";
  const PackageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final _isLoading = useState(true);
    final _package = useState(
      Package.empty(),
    );

    void _deletePackage() async {
      await PackageRepository().deletePackage(id);

      Navigator.popUntil(
          context, ModalRoute.withName(PreLoadingScreen.routeName));
    }

    void _confirmPackage() async {
      await PackageRepository().confirmPackage(id);
      Navigator.of(context).popUntil(
        ModalRoute.withName(PreLoadingScreen.routeName),
      );
    }

    Future<void> _showDeleteAlertBox() async {
      return showDialog(
        context: context,
        builder: (ctx) => AlertBox(
          message: "Are you sure?",
          onNegative: () => Navigator.pop(context),
          onPositive: _deletePackage,
        ),
      );
    }

    Future<void> _showConfirmDialog() async {
      return showDialog(
        context: context,
        builder: (ctx) => AlertBox(
          message: "Confirm this delivery?",
          onNegative: () => Navigator.pop(context),
          onPositive: _confirmPackage,
        ),
      );
    }

    void _fetchPackageInfo() async {
      _isLoading.value = true;
      _package.value = await PackageRepository().getPackage(id);
      _isLoading.value = false;
    }

    useEffect(() {
      _fetchPackageInfo();
    }, []);

    return Scaffold(
      appBar: BackAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: kSizeS * 1.5,
            vertical: kSizeS,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.sectionHeaderBlack(
                _package.value.roomNumber,
                context,
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
                "Status: ${_package.value.deliveredAt.isEmpty ? "Arrived" : "Delivered"}",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: kFontSizeHeadline4,
                    ),
              ),
              kSizedBoxVerticalXS,
              CustomText.sectionHeaderBlack(
                "Note",
                context,
              ),
              kSizedBoxVerticalS,
              Container(
                width: MediaQuery.of(context).size.width,
                height: kSizeXL * 1.5,
                child: TextWallDisplay(
                  text: _package.value.note.isEmpty ? "-" : _package.value.note,
                ),
              ),
              kSizedBoxVerticalS,
              CustomText.sectionHeaderBlack(
                "Package Photo",
                context,
              ),
              kSizedBoxVerticalS,
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
              ),
              kSizedBoxVerticalM,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleIconButton(
                    color: kErrorColor,
                    onPressed: _showDeleteAlertBox,
                    icon: Icons.delete,
                  ),
                  kSizedBoxHorizontalS,
                  CircleIconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(PostalEditScreen.routeName, arguments: id)
                          .then(
                            (value) => _fetchPackageInfo(),
                          );
                    },
                    icon: Icons.edit,
                  ),
                ],
              ),
              kSizedBoxVerticalM,
              Divider(),
              CustomButton(
                text: "CONFIRM",
                onPressed: _showConfirmDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
