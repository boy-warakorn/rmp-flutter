import 'package:dio/dio.dart';
import 'package:rmp_flutter/configs/api.dart';

final dioOptions = BaseOptions(baseUrl: baseApiUrl);

final dio = Dio(dioOptions);
