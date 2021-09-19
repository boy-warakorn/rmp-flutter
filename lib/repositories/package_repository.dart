import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rmp_flutter/configs/api.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/models/token.dart';
import 'package:rmp_flutter/repositories/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PackageDto {
  final String roomNumber;
  final String note;
  final String arrivedAt;
  final String postalService;

  PackageDto({
    required this.roomNumber,
    this.note = "",
    required this.arrivedAt,
    required this.postalService,
  });
}

abstract class BasePackageRepository {
  Future<PackagesModel> getPackages();
  Future<Package> getPackage(String id);
  Future<List<String>> getPackageMasterData();
  Future<void> createPackage(PackageDto package);
  Future<void> editPackage(PackageDto package, String id);
  Future<void> deletePackage(String id);
}

class PackageRepository implements BasePackageRepository {
  @override
  Future<void> createPackage(PackageDto package) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      await dio.post(
        getCreatePackageUrl,
        data: {
          "roomNumber": package.roomNumber,
          "note": package.note,
          "arrivedAt": package.arrivedAt,
          "postalService": package.postalService,
        },
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );
    } on DioError catch (_) {
      throw HttpException("Create report failed");
    }
  }

  @override
  Future<void> deletePackage(String id) {
    // TODO: implement deletePackage
    throw UnimplementedError();
  }

  @override
  Future<void> editPackage(PackageDto package, String id) {
    // TODO: implement editPackage
    throw UnimplementedError();
  }

  @override
  Future<Package> getPackage(String id) {
    // TODO: implement getPackage
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getPackageMasterData() {
    // TODO: implement getPackageMasterData
    throw UnimplementedError();
  }

  @override
  Future<PackagesModel> getPackages() async {
    try {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      final response = await dio.get(
        "$getPackagesUrl/?status=in-storage",
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );

      return PackagesModel.fromJSON(response);

    } on DioError catch (_) {
      throw HttpException("Get Reports Failed");
    }
  }
}
