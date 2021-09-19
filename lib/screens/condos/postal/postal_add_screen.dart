import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/room.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/repositories/room_repository.dart';
import 'package:rmp_flutter/screens/main_screen.dart';
import 'package:rmp_flutter/widgets/forms/form_text_area.dart';
import 'package:rmp_flutter/widgets/forms/form_text_field.dart';
import 'package:rmp_flutter/widgets/general/alert_box.dart';
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
    final _roomNumberList = useState(RoomNumbersModel(roomNumbers: []));

    void _fetchRoomNumbers() async {
      _isLoading.value = true;
      _roomNumberList.value = RoomNumbersModel(
        roomNumbers: await RoomRepository().getRoomIdList(),
      );
      _isLoading.value = false;

      print(_roomNumberList.value.roomNumbers);
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
          .pushNamedAndRemoveUntil(MainScreen.routeName, (_) => false);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FormTextField(
                      fieldName: "Delivered By",
                      textEditingController: _deliveredBy,
                    ),
                  ),
                  kSizedBoxHorizontalM,
                  Expanded(
                    child: FormTextField(
                      fieldName: "Delivered Date",
                      textEditingController: _deliveredDate,
                      suffixIcon: Icon(
                        Icons.date_range_outlined,
                      ),
                    ),
                  ),
                ],
              ),
              kSizedBoxVerticalS,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertBox(
                            message: "Are you sure?",
                            onNegative: () => Navigator.of(context).pop(),
                            onPositive: () {
                              _createPackage(context);
                            },
                          ),
                        ),
                      },
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
