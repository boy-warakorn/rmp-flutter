import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rmp_flutter/configs/api.dart';
import 'package:rmp_flutter/models/token.dart';
import 'package:rmp_flutter/repositories/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseAuthRepository {
  Future<void> login(AuthDto authDto);
}

class AuthDto {
  final String username;
  final String password;

  AuthDto({
    required this.username,
    required this.password,
  });
}

class AuthRepository implements BaseAuthRepository {
  @override
  Future<void> login(AuthDto authDto) async {
    try {
      final result = await dio.post(
        baseAuthUrl,
        data: {
          "username": authDto.username,
          "password": authDto.password,
        },
      );

      final tokenModel = TokenModel.fromJson(result);
      final prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey("token")) {
        await prefs.remove("token");
      }
      await prefs.setString("token", tokenModel.token);
    } on DioError catch (_) {
      throw const HttpException("Login failed");
    }
  }
}
