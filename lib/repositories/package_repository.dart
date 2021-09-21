import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rmp_flutter/configs/api.dart';
import 'package:rmp_flutter/models/package.dart';
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
  Future<PackagesModel> getPackageByResident();
  Future<Package?> getPackage(String id);
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
      throw HttpException("Create Package failed");
    }
  }

  @override
  Future<void> deletePackage(String id) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      await dio.delete(getDeletePackageUrl(id),
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ));
    } on DioError catch (_) {
      throw HttpException("Delete package failed");
    }
  }

  @override
  Future<void> editPackage(PackageDto package, String id) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      await dio.post(
        getEditPackageUrl(id),
        data: {
          "note": package.note,
          "arrivedAt": package.arrivedAt,
          "postalService": package.arrivedAt,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
    } on DioError catch (_) {
      throw HttpException("Edit package failed");
    }
  }

  @override
  Future<Package> getPackage(String id) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      final response = await dio.get(
        getPackageByIdUrl(id),
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );

      return Package.fromJSON(response);
    } on DioError catch (_) {
      throw HttpException("Get single package failed");
    }
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
      throw HttpException("Get Packages Failed");
    }
  }

  @override
  Future<PackagesModel> getPackageByResident() async {
    try {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      final response = await dio.get(
        getPackagesByResidentUrl,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );

      return PackagesModel.fromJSON(response);
    } on DioError catch (_) {
      throw HttpException("Failed to get Packages by Resident");
    }
  }
}
