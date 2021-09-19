import 'dart:convert';

class RoomNumbersModel{
  final List<String> roomNumbers;

  RoomNumbersModel({required this.roomNumbers});

  factory RoomNumbersModel.fromJSON(dynamic fetchedResult){
    Iterable idList = jsonDecode(fetchedResult.toString())["roomNumbers"];

    return RoomNumbersModel(roomNumbers: idList.map((e) => e.toString()).toList());
  }
}