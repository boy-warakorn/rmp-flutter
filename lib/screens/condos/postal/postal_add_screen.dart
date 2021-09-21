import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/models/room.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/repositories/room_repository.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/widgets/forms/autocomplete_text_field.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
<<<<<<< HEAD
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
=======
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
>>>>>>> develop
import 'package:rmp_flutter/widgets/general/custom_button.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class PostalAddScreen extends HookWidget {
  static const routeName = "/condo/postal-add";
  const PostalAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseRoomValidityStyle = Theme.of(context).textTheme.bodyText2;

    final validRoomText = Text(
      "Valid room",
      style: baseRoomValidityStyle?.copyWith(
        color: kSuccessColor,
      ),
    );
    final invalidRoomText = Text(
      "Invalid room",
      style: baseRoomValidityStyle?.copyWith(
        color: kErrorColor,
      ),
    );

    final _roomNumber = useTextEditingController();
    final _deliveredBy = useTextEditingController();
    final _deliveredDate = useTextEditingController();
    final _note = useTextEditingController();

    final _isLoading = useState(true);
    final _haveDate = useState(false);
    final _roomNumberList = useState(RoomNumbersModel(roomNumbers: []));
    final _serviceList = useState(PackageMasterModel(postalService: []));

    final _isValidRoom = useState(false);
    final _showRoomValidity = useState(false);

    void _updateRoomValid(String roomInput) {
      _showRoomValidity.value = roomInput.isNotEmpty;

      _isValidRoom.value = _roomNumberList.value.roomNumbers
          .any((masterItem) => masterItem == roomInput);
    }

    void _updateEditingController(
        String value, TextEditingController controller) {
      controller.text = value;
    }

    void _fetchMasterData() async {
      _isLoading.value = true;

      _roomNumberList.value = RoomNumbersModel(
        roomNumbers: await RoomRepository().getRoomIdList(),
      );
      _serviceList.value = await PackageRepository().getPackageMasterData();

      _isLoading.value = false;
    }

    void _createPackage(BuildContext context) async {
      final packageDto = PackageDto(
        roomNumber: _roomNumber.text,
        arrivedAt: _deliveredDate.text.isEmpty
            ? "2020-02-20 05:20"
            : _deliveredDate.text,
        postalService:
            _deliveredBy.text.isEmpty ? "Unspecified" : _deliveredBy.text,
        note: _note.text,
      );

      await PackageRepository().createPackage(packageDto);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(PreLoadingScreen.routeName, (_) => false);
    }

    useEffect(() {
      _fetchMasterData();
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
          child: _isLoading.value
              ? CenteredProgressIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.sectionHeaderBlack("Room Number", context),
                    kSizedBoxVerticalXS,
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AutoCompleteTextField(
                            context,
                            hintText: "Room Number",
                            textEditingController: _roomNumber,
                            optionList: _roomNumberList.value.roomNumbers,
                            onChanged: (value) {
                              _updateRoomValid(value);
                              _updateEditingController(value, _roomNumber);
                            },
                            onSelected: (value) {
                              _updateRoomValid(value);
                              _updateEditingController(value, _roomNumber);
                            },
                          ),
                        ),
                        kSizedBoxHorizontalXS,
                        Expanded(
                          child: _showRoomValidity.value
                              ? _isValidRoom.value
                                  ? validRoomText
                                  : invalidRoomText
                              : SizedBox(),
                        ),
                      ],
                    ),
                    kSizedBoxVerticalS,
                    CustomText.sectionHeaderBlack("Delivered by", context),
                    kSizedBoxVerticalS,
                    AutoCompleteTextField(
                      context,
                      textEditingController: _deliveredBy,
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
                    kSizedBoxVerticalS,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
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
                              _deliveredDate.clear(),
                              _note.clear(),
                            },
                            color: kWarningColor,
                          ),
                        ),
                        if (_isValidRoom.value)
                          Row(
                            children: [
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
