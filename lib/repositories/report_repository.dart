import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rmp_flutter/configs/api.dart';
import 'package:rmp_flutter/models/report.dart';
import 'package:rmp_flutter/repositories/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseReportRepository {
  Future<ReportsModel> getReportsByResident(String status, String type);
  Future<Report> getReport(String id);
  Future<void> createReport(CreateReportDto createReportDto);
  Future<ReportsModel> getReportsByCondo(bool isResponded, String type);
  Future<void> replyReport(String id, ReplyReportDto replyReportDto);
  Future<void> setResolvedOnReport(
      String id, ResolveReportDto resolveReportDto);
}

class CreateReportDto {
  final String title;
  final String detail;
  final List<String> imgList;
  final String type;
  final List<String> dayList;

  CreateReportDto({
    required this.detail,
    required this.title,
    required this.imgList,
    required this.type,
    required this.dayList,
  });
}

class ReplyReportDto {
  final String respondDetail;

  ReplyReportDto({
    required this.respondDetail,
  });
}

class ResolveReportDto {
  final String detail;
  final String resolveBy;

  const ResolveReportDto({required this.detail, required this.resolveBy});
}

class ReportRepository implements BaseReportRepository {
  @override
  Future<ReportsModel> getReportsByResident(String status, String type) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final result = await dio.get(
        getReportsResidentUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        queryParameters: {
          'status': status,
          'type': type,
        },
      );
      return ReportsModel.fromJson(result);
    } on DioError catch (_) {
      throw HttpException("Get Reports By Resident Failed");
    }
  }

  @override
  Future<Report> getReport(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final result = await dio.get(
        getReportUrl(id),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return Report.fromJson(result.toString(), true);
    } on DioError catch (_) {
      throw HttpException("Get Report Failed");
    }
  }

  @override
  Future<void> createReport(CreateReportDto createReportDto) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      await dio.post(
        createReportUrl,
        data: {
          "title": createReportDto.title,
          "detail": createReportDto.detail,
          "imgList": createReportDto.imgList,
          "dayList": createReportDto.dayList,
          "type": createReportDto.type,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioError catch (_) {
      throw HttpException("Create Report Failed");
    }
  }

  @override
  Future<ReportsModel> getReportsByCondo(bool isResponded, String type) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final result = await dio.get(
        getReportsUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        queryParameters: {
          'status': isResponded ? 'responded' : 'pending',
          'type': type,
          'mobile': true,
        },
      );
      return ReportsModel.fromJson(result);
    } on DioError catch (_) {
      throw HttpException("Get Reports By Condo Failed");
    }
  }

  @override
  Future<void> replyReport(String id, ReplyReportDto replyReportDto) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      await dio.post(
        replyReportUrl(id),
        data: {
          "detail": replyReportDto.respondDetail,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioError catch (_) {
      throw HttpException("Reply Reports Failed");
    }
  }

  @override
  Future<void> setResolvedOnReport(
      String id, ResolveReportDto resolveReportDto) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      await dio.post(
        resolveReportUrl(id),
        data: {
          "detail": resolveReportDto.detail,
          "resolveBy": resolveReportDto.resolveBy,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioError catch (_) {
      throw HttpException("Set Resolved on Report Failed");
    }
  }
}
