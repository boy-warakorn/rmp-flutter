import 'package:dio/dio.dart';
import 'package:rmp_flutter/configs/api.dart';
import 'package:rmp_flutter/models/user.dart';
import 'package:rmp_flutter/repositories/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseUserRepository {
  Future<UserModel> getCurrentUser();
  Future<void> updateDeviceId(String deviceId);
}

class UserRepository implements BaseUserRepository {
  @override
  Future<void> updateDeviceId(String deviceId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        await dio.post(
          updateDeviceIdUrl,
          data: {"deviceId": deviceId},
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );
      }
    } on DioError catch (_) {
      return;
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        final result = await dio.get(
          baseUserUrl,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );
        return UserModel.fromJson(result);
      }
      return UserModel(
          role: "",
          name: "",
          businessName: "",
          userId: "",
          phoneNumber: "",
          citizenNumber: "");
    } on DioError catch (_) {
      return UserModel(
          role: "",
          name: "",
          businessName: "",
          userId: "",
          phoneNumber: "",
          citizenNumber: "");
    }
  }
}
