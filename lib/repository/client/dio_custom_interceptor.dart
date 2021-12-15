import 'package:dio/dio.dart';

class DioCustomInterceptors extends Interceptor {
  final Dio dio;
  DioCustomInterceptors({required this.dio}) {
    dio.interceptors.add(this);
  }

  var customHeaders = {
    Headers.contentTypeHeader: Headers.jsonContentType,
    'Accept': Headers.acceptHeader,
  };

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // print('REQUEST[${options.method}] => PATH: ${options.path}');

    options.baseUrl = 'https://us-central1-inventory-ts-firestore.cloudfunctions.net/api';
    options.connectTimeout = 20000;
    // Transform response data to Json Map
    options.responseType = ResponseType.json;
    //Add headers
    options.headers.addAll(customHeaders);

    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    // print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  onError(DioError dioError, ErrorInterceptorHandler handler) async {
    print('ERROR[${dioError.response?.statusCode}]');
    print('ERROR[${dioError.response?.data}]');
    if (CancelToken.isCancel(dioError)) {
      print('User cancelled the request');
    }

    // Assume 401 stands for token expired
    final refreshEr = ["jwt expired", "Unauthorized", "invalid signature"];
    if (dioError.response?.statusCode == 401 && refreshEr.contains(dioError.response!.data!["message"])) {
      //Refresh token here & resend request...
    }
    return super.onError(dioError, handler);
  }
}
