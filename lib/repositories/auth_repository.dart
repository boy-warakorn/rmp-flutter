import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rmp_flutter/configs/api.dart';
import 'package:rmp_flutter/repositories/api.dart';

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
      print({
        "username": authDto.username,
        "password": authDto.password,
      });
      final token = await dio.post(
        baseAuthUrl,
        data: {
          "username": authDto.username,
          "password": authDto.password,
        },
      );
      print(token);
    } on DioError catch (e) {
      print(e);
      throw const HttpException("Something went wrong");
    }
  }
}
