import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/room.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/repositories/room_repository.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class PostalAddScreen extends HookWidget {
  static const routeName = "/condo/postal-add";
  const PostalAddScreen({Key? key}) : super(key: key);

  // TODO: apply autocomplete textfield
  @override
  Widget build(BuildContext context) {
    final _roomNumber = useTextEditingController();
    final _deliveredBy = useTextEditingController();
    final _deliveredDate = useTextEditingController();
    final _note = useTextEditingController();

    final _isLoading = useState(true);
    final _haveDate = useState(false);
    final _roomNumberList = useState(RoomNumbersModel(roomNumbers: []));

    void _fetchRoomNumbers() async {
      _isLoading.value = true;
      _roomNumberList.value = RoomNumbersModel(
        roomNumbers: await RoomRepository().getRoomIdList(),
      );
      _isLoading.value = false;
    }

    void _createPackage(BuildContext context) async {
      if (_roomNumberList.value.roomNumbers.contains(_roomNumber.text)) {
        final packageDto = PackageDto(
          roomNumber: _roomNumber.text,
          arrivedAt: _deliveredDate.text,
          postalService: _deliveredBy.text,
          note: _note.text,
        );

        await PackageRepository().createPackage(packageDto);
      } else {
        print("Invalid room");
      }
      Navigator.of(context)
          .pushNamedAndRemoveUntil(PreLoadingScreen.routeName, (_) => false);
    }

    useEffect(() {
      _fetchRoomNumbers();
    }, []);

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: BackAppBar(),
      body: Container(
        padding: EdgeInsets.only(
          left: kSizeS * 1.5,
          right: kSizeS * 1.5,
          top: kSizeS,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: FormTextField(
                  fieldName: "Room number",
                  textEditingController: _roomNumber,
                ),
              ),
              kSizedBoxVerticalS,
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
                          FocusScope.of(context).requestFocus(FocusNode());
                          DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now().subtract(Duration(days: 0)),
                            onConfirm: (date) {
                              String dateString =
                                  DateFormat("yyyy-MM-dd – kk:mm").format(date);
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
              FormTextArea(
                fieldName: "Note",
                textEditingController: _note,
                minLine: 5,
                maxLine: 10,
              ),
              kSizedBoxVerticalM,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: kSizeXL / 1.25,
                    child: CustomButton(
                      text: "CLEAR",
                      onPressed: () => {
                        _roomNumber.clear(),
                        _deliveredBy.clear(),
                        _deliveredDate.clear(),
                        _note.clear(),
                      },
                      color: kWarningColor,
                    ),
                  ),
                  kSizedBoxHorizontalS,
                  Container(
                    width: kSizeXL / 1.25,
                    child: CustomButton(
                      text: "ADD",
                      onPressed: () => _createPackage(context),
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
