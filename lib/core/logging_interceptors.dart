import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// [LoggingInterceptor] is used to print logs during network requests. It is
/// better to add [LoggingInterceptor] to the tail of the interceptor queue,
/// otherwise the changes made in the interceptor behind A will not be printed
/// out. This is because the execution of interceptors is in the order of the
/// addition.

class LoggingInterceptors extends Interceptor {
  LoggingInterceptors();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint('*** Request Logging - Start ***');

    printKV('URI', options.uri);
    printKV('METHOD', options.method);
    logPrint('HEADERS:');
    options.headers.forEach((key, v) => printKV(' - $key', v));
    logPrint('BODY:');
    printAll(options.data ?? "");

    logPrint('*** Request Logging - End ***');
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    logPrint('*** Api Error Logging - Start ***:');

    logPrint('URI: ${err.requestOptions.uri}');
    if (err.response != null) {
      logPrint('STATUS CODE: ${err.response!.statusCode?.toString()}');
    }
    logPrint('$err');
    if (err.response != null) {
      printKV('REDIRECT', err.response!.realUri);
      logPrint('BODY:');
      printAll(err.response?.toString());
    }

    logPrint('*** Api Error Logging - End ***:');
    return err;
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    logPrint('*** API Response Logging - Start ***');

    printKV('URI', response.requestOptions.uri);
    printKV('STATUS CODE', response.statusCode);
    printKV('REDIRECT', response.isRedirect);
    logPrint('BODY:');
    printAll(response.data ?? "");

    logPrint('*** API Response Logging - End ***');

    return response;
  }

  void printKV(String key, Object? v) {
    logPrint('$key: $v');
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String s) {
    debugPrint(s);
  }
}
