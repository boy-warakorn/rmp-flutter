import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/screens/condos/postal/package_detail_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class PostalEditScreen extends HookWidget {
  static const routeName = "/condo/postal-edit";
  const PostalEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _deliveredBy = useTextEditingController();
    final _deliveredDate = useTextEditingController();
    final _note = useTextEditingController();
    final _haveDate = useState(false);

    final id = ModalRoute.of(context)?.settings.arguments as String;

    late Package pk;

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
    final _isLoading = useState(true);

    void _fetchPackageInfo() async {
      _isLoading.value = true;
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
        ),
        id,
      );

      Navigator.popUntil(
          context, ModalRoute.withName(PackageDetailScreen.routeName));
    }

    useEffect(() {
      _fetchPackageInfo();
    }, []);

    return Scaffold(
      appBar: BackAppBar(),
      backgroundColor: kBgColor,
      body: _isLoading.value
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
                  FormTextField(
                    fieldName: "Delivered By",
                    textEditingController: _deliveredBy,
                  ),
                  kSizedBoxHorizontalM,
                  kSizedBoxVerticalS,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivered Date",
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              color: kBlackColor,
                            ),
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
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                            ),
                            enableInteractiveSelection: false,
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              DatePicker.showDateTimePicker(
                                context,
                                showTitleActions: true,
                                minTime:
                                    DateTime.now().subtract(Duration(days: 0)),
                                onConfirm: (date) {
                                  String dateString =
                                      DateFormat("yyyy-MM-dd – kk:mm")
                                          .format(date);
                                  _deliveredDate.text = dateString;
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
                  kSizedBoxVerticalS,
                  FormTextArea(
                    fieldName: "Note",
                    textEditingController: _note,
                    minLine: 5,
                    maxLine: 10,
                  ),
                  Spacer(),
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
    );
  }
}
