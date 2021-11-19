import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rmp_flutter/configs/api.dart';
import 'package:rmp_flutter/models/payment.dart';
import 'package:rmp_flutter/repositories/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BasePaymentRepository {
  Future<Payment> getCommonCharge();
  Future<void> paySpecificPayment(String id, String receiptUrl);
  Future<PaymentModel> getPaymentByStatus(String status);
}

class CreatePaymentDto {
  final String id;
  final String paidAt;
  final int amount;
  final String status;
  final String receivedUrl;

  CreatePaymentDto({
    required this.id,
    required this.paidAt,
    required this.amount,
    required this.status,
    required this.receivedUrl,
  });
}

class PaymentRepository implements BasePaymentRepository {
  @override
  Future<Payment> getCommonCharge() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final result = await dio.get(
        getCommonChargeUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        queryParameters: {
          'type': 'common-charge',
        },
      );
      return Payment.fromJson(result);
    } on DioError catch (_) {
      throw HttpException("Get Common Charge Failed");
    }
  }

  @override
  Future<void> paySpecificPayment(String id, String receiptUrl) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      await dio.post(
        paySpecificPaymentUrl(id),
        data: {
          "receiptUrl": receiptUrl,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioError catch (_) {}
  }

  @override
  Future<PaymentModel> getPaymentByStatus(String status) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final result = await dio.get(
        getPaymentsUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        queryParameters: {
          'status': status,
        },
      );
      return PaymentModel.fromJson(result);
    } on DioError catch (_) {
      throw HttpException("Get Filter Payment By Status Failed");
    }
  }
}
