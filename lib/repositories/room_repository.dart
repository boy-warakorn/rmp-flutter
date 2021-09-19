import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rmp_flutter/configs/api.dart';
import 'package:rmp_flutter/repositories/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseRoomRepository {
  Future<List<String>> getRoomIdList();
}

class RoomRepository implements BaseRoomRepository {
  @override
  Future<List<String>> getRoomIdList() async {
    print("triggered");

    try {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      final response = await dio.get(getRoomIdListUrl,
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ));

      Iterable idList = jsonDecode(response.toString())["roomNumbers"];

      return idList.map((e) => e.toString()).toList();
    } on DioError catch (_) {
      throw HttpException("Get room id list failed");
    }
  }
}
