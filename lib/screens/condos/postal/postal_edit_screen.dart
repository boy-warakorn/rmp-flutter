import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/screens/condos/postal/package_detail_screen.dart';
import 'package:rmp_flutter/utils/date_format.dart';
import 'package:rmp_flutter/widgets/forms/autocomplete_text_field.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
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
    final _haveDate = useState(true);

    final id = ModalRoute.of(context)?.settings.arguments as String;

    late Package pk;

    final _package = useState(Package.empty());

    final _isLoading = useState(true);
    final _haveService = useState(true);

    bool _submitAllowed() {
      return _haveService.value && _haveDate.value;
    }

    void _updateHaveService(String serviceInput) {
      _haveService.value = serviceInput.isNotEmpty;
    }

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

    void _submit() async {
      await PackageRepository().editPackage(
        PackageDto(
          roomNumber: _package.value.roomNumber,
          arrivedAt: _deliveredDate.text,
          postalService: _deliveredBy.text,
          note: _note.text,
          imgList: [],
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
                    CustomText.sectionHeaderBlack(
                      "You are editing ${_package.value.roomNumber}",
                      context,
                    ),
                    kSizedBoxVerticalS,
                    CustomText.sectionHeaderBlack(
                      "Owner: ${_package.value.roomOwner}",
                      context,
                    ),
                    kSizedBoxVerticalS,
                    CustomText.sectionHeaderBlack("Delivered by", context),
                    kSizedBoxVerticalXS,
                    AutoCompleteTextField(
                      context,
                      textEditingController: _deliveredBy,
                      initialText: _package.value.postalService,
                      optionList: _serviceList.value.postalService,
                      hintText: "Delivery person or service",
                      onChanged: _updateHaveService,
                      onSelected: _updateHaveService,
                    ),
                    kSizedBoxVerticalS,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.sectionHeaderBlack(
                          "Delivered Date",
                          context,
                        ),
                        kSizedBoxVerticalXS,
                        InkWell(
                          child: Container(
                            height: kSizeM,
                            width: kSizeXXXL,
                            child: TextFormField(
                              controller: _deliveredDate,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: kLightColor,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: kBorderRadiusM,
                                  borderSide: BorderSide(
                                    color: kInputBorderColor,
                                    width: kSizeXXXS / 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: kBorderRadiusM,
                                  borderSide: BorderSide(
                                    color: kInputBorderColor,
                                    width: kSizeXXXS / 2,
                                  ),
                                ),
                                focusColor: kInputBorderColor,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: kSizeS,
                                  vertical: kSizeS / 1.7,
                                ),
                                hintText: "Delivered Date",
                                hintStyle:
                                    Theme.of(context).textTheme.subtitle1,
                              ),
                              enableInteractiveSelection: false,
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                DatePicker.showDateTimePicker(
                                  context,
                                  showTitleActions: true,
                                  maxTime: DateTime.now(),
                                  onConfirm: (date) {
                                    _deliveredDate.text =
                                        getDateTimeString(date);
                                    _haveDate.value = true;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    kSizedBoxVerticalS,
                    FormTextArea(
                      fieldName: "Note",
                      textEditingController: _note,
                      minLine: 5,
                      maxLine: 10,
                    ),
                    kSizedBoxVerticalS,
                    kSizedBoxVerticalL,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: kSizeXL / 1.25,
                          child: CustomButton(
                            enabled: _submitAllowed(),
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
