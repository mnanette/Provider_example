import 'package:dio/dio.dart';

class DioService {
  static final DioService _instance = DioService._internal();
  final Dio dio;

  factory DioService() {
    return _instance;
  }

  DioService._internal() : dio = Dio();
}

final dioService = DioService();
