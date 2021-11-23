// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/enums/user_interface_image_source.dart';
import 'package:rmp_flutter/utils/date_format.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/models/room.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/repositories/room_repository.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/widgets/forms/autocomplete_text_field.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';
import 'package:rmp_flutter/widgets/interactions/attachment_list.dart';
import 'package:rmp_flutter/widgets/interactions/custom_button.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';
import 'package:image_picker/image_picker.dart';

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
    final _haveService = useState(false);
    final _showRoomValidity = useState(false);

    String _fileName = '';
    ValueNotifier<File?> _packagePhoto = useState(null);

    bool _submitAllowed() {
      return _isValidRoom.value && _haveService.value && _haveDate.value;
    }

    void _updateValidRoom(String roomInput) {
      _showRoomValidity.value = roomInput.isNotEmpty;

      _isValidRoom.value = _roomNumberList.value.roomNumbers
          .any((masterItem) => masterItem == roomInput);
    }

    void _updateHaveService(String serviceInput) {
      _haveService.value = serviceInput.isNotEmpty;
    }

    void _fetchMasterData() async {
      _isLoading.value = true;

      _roomNumberList.value = RoomNumbersModel(
        roomNumbers: await RoomRepository().getRoomIdList(),
      );
      _serviceList.value = await PackageRepository().getPackageMasterData();

      _isLoading.value = false;
    }

    Future<void> getUserImage({required ImageSource source}) async {
      final picker = ImagePicker();
      final slipPhoto = await picker.pickImage(source: source);

      if (slipPhoto != null) {
        _packagePhoto.value = File(slipPhoto.path);
      }
    }

    Future<void> confirmAdd() async {
      try {
        _isLoading.value = true;

        final imgUrlList = <String>[];

        if (_packagePhoto.value != null) {
          final storageRef =
              FirebaseStorage.instance.ref().child('packagePhoto/$_fileName');
          await storageRef.putFile(_packagePhoto.value!);
          final url = await storageRef.getDownloadURL();
          imgUrlList.add(url.toString());
        }

        final packageDto = PackageDto(
          roomNumber: _roomNumber.text,
          arrivedAt: _deliveredDate.text,
          postalService: _deliveredBy.text,
          note: _note.text,
          imgList: imgUrlList,
        );

        await PackageRepository().createPackage(packageDto);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(PreLoadingScreen.routeName, (_) => false);
      } catch (e) {
        print(e.toString());
      }
      _isLoading.value = false;
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
        child: _isLoading.value
            ? CenteredProgressIndicator()
            : SingleChildScrollView(
                child: Column(
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
                            onChanged: _updateValidRoom,
                            onSelected: _updateValidRoom,
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
                      onChanged: _updateHaveService,
                      onSelected: _updateHaveService,
                    ),
                    kSizedBoxVerticalS,
                    CustomText.sectionHeaderBlack("Delivered Date", context),
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
                              maxTime: DateTime.now(),
                              onConfirm: (date) {
                                _deliveredDate.text = getDateTimeString(date);
                                _haveDate.value = true;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    kSizedBoxVerticalS,
                    FormTextArea(
                      fieldName: "Note",
                      textEditingController: _note,
                      minLine: 5,
                      maxLine: 10,
                    ),
                    kSizedBoxVerticalS,
                    Row(
                      children: [
                        CustomText.sectionHeaderBlack(
                          "Attachments (Optional)",
                          context,
                        ),
                        kSizedBoxHorizontalXS,
                        IconButton(
                          splashRadius: kSizeS * 1.5,
                          icon: Icon(
                            Icons.cloud_upload_outlined,
                          ),
                          color: kBrandColor,
                          onPressed: () {
                            showModalBottomSheet<dynamic>(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(kSizeS),
                                  topRight: Radius.circular(kSizeS),
                                ),
                              ),
                              builder: (context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: CustomButton(
                                          text: "Take a photo",
                                          onPressed: () => getUserImage(
                                              source: ImageSource.camera),
                                          padding: EdgeInsets.symmetric(
                                            vertical: kSizeXS,
                                            horizontal: kSizeXS,
                                          ),
                                        ),
                                      ),
                                      kSizedBoxVerticalXS,
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: CustomButton(
                                          text: "Choose from gallery",
                                          onPressed: () => getUserImage(
                                              source: ImageSource.gallery),
                                          color: kWarningColor,
                                          padding: EdgeInsets.symmetric(
                                            vertical: kSizeXS,
                                            horizontal: kSizeXS,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    kSizedBoxVerticalS,
                    AttachmentList(
                      imgSourceType: UserInterfaceImageSource.filePath,
                      imgSourceStrings: _packagePhoto.value == null
                          ? []
                          : <String>[_packagePhoto.value!.path],
                    ),
                    kSizedBoxVerticalL,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: kSizeXL / 1.25,
                          child: CustomButton(
                            text: "CLEAR",
                            onPressed: () {
                              _deliveredDate.clear();
                              _haveDate.value = false;
                              _note.clear();
                            },
                            color: kWarningColor,
                          ),
                        ),
                        Row(
                          children: [
                            kSizedBoxHorizontalS,
                            Container(
                              width: kSizeXL / 1.25,
                              child: CustomButton(
                                enabled: _submitAllowed(),
                                text: "ADD",
                                onPressed: confirmAdd,
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
