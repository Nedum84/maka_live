import 'package:dio/dio.dart';
import 'package:maka_live/repository/client/dio_custom_interceptor.dart';

class ApiClient {
  static Dio request() {
    var dio = Dio();
    dio.interceptors.add(DioCustomInterceptors(dio: dio));
    return dio;
  }
}

final apiClient = ApiClient.request();
