import 'package:dio/dio.dart';

import '../constants.dart';
import 'app_interceptors.dart';

class ApiProvider {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: baseUrl));

  ApiProvider._internal();

  static final _singleton = ApiProvider._internal();

  factory ApiProvider() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000,
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    dio.interceptors.add(AppInterceptors(dio));
    return dio;
  }
}
