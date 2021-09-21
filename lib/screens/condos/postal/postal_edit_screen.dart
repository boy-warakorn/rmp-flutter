import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/screens/condos/postal/package_detail_screen.dart';
import 'package:rmp_flutter/widgets/forms/autocomplete_text_field.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class PostalEditScreen extends HookWidget {
  static const routeName = "/condo/postal-edit";
  const PostalEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _serviceList = useState(PackageMasterModel(postalService: []));

    final _deliveredBy = useTextEditingController();
    final _deliveredDate = useTextEditingController();
    final _note = useTextEditingController();
    final _haveDate = useState(false);

    final id = ModalRoute.of(context)?.settings.arguments as String;

    late Package pk;

    final _package = useState(Package.empty());

    final _isLoading = useState(true);

    void _fetchMasterData() async {
      _isLoading.value = true;

      _serviceList.value = await PackageRepository().getPackageMasterData();

      pk = await PackageRepository().getPackage(id);
      _package.value = pk;
      _deliveredBy.text = pk.postalService;
      _deliveredDate.text = pk.arrivedAt;
      _note.text = pk.note;

      _isLoading.value = false;
    }

    void _updateEditingController(
        String value, TextEditingController controller) {
      controller.text = value;
    }

    void _submit() async {
      await PackageRepository().editPackage(
        PackageDto(
          roomNumber: _package.value.roomNumber,
          arrivedAt: _deliveredDate.text.isEmpty
              ? "2020-02-20 05:20"
              : _deliveredDate.text,
          postalService:
              _deliveredBy.text.isEmpty ? "Unspecified" : _deliveredBy.text,
          note: _note.text,
        ),
        id,
      );

      Navigator.popUntil(
          context, ModalRoute.withName(PackageDetailScreen.routeName));
    }

    useEffect(() {
      _fetchMasterData();
    }, []);

    return Scaffold(
      appBar: BackAppBar(),
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: _isLoading.value
            ? CenteredProgressIndicator()
            : Container(
                padding: EdgeInsets.only(
                  left: kSizeS * 1.5,
                  right: kSizeS * 1.5,
                  top: kSizeS,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You are editing ${_package.value.roomNumber}",
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: kBlackColor,
                          ),
                    ),
                    kSizedBoxVerticalS,
                    kSizedBoxVerticalXS,
                    Text(
                      "Owner: ${_package.value.roomOwner}",
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: kBlackColor,
                          ),
                    ),
                    kSizedBoxVerticalS,
                    kSizedBoxVerticalXS,
                    CustomText.sectionHeaderBlack("Delivered by", context),
                    kSizedBoxVerticalS,
                    AutoCompleteTextField(
                      context,
                      textEditingController: _deliveredBy,
                      initialText: _package.value.postalService,
                      optionList: _serviceList.value.postalService,
                      hintText: "Delivery person or service",
                      onChanged: (value) {
                        _updateEditingController(value, _deliveredBy);
                      },
                      onSelected: (value) {
                        _updateEditingController(value, _deliveredBy);
                      },
                    ),
                    kSizedBoxVerticalS,
                    FormTextField(
                      fieldName: "Delivered Date",
                      textEditingController: _deliveredDate,
                      suffixIcon: Icon(
                        Icons.date_range_outlined,
                      ),
                    ),
                    FormTextArea(
                      fieldName: "Note",
                      textEditingController: _note,
                      minLine: 5,
                      maxLine: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: kSizeXL / 1.25,
                          child: CustomButton(
                            text: "SUBMIT",
                            onPressed: _submit,
                          ),
                        ),
                      ],
                    ),
                    kSizedBoxVerticalM,
                  ],
                ),
              ),
      ),
    );
  }
}
