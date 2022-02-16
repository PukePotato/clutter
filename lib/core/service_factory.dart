import 'dart:io';

import 'package:clutter/core/logging_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ServiceFactory {
  late Dio dio;
  late String baseUrl;
  final Map<String, dynamic> params;
  final List<LoggingInterceptors>? interceptors;
  late BaseOptions? options;

  /// For the test only
  ServiceFactory.test(
    Dio dio, {
    required this.baseUrl,
    required this.params,
    this.interceptors,
  });

  ServiceFactory({
    required this.baseUrl,
    required this.params,
    this.interceptors,
  }) {
    options = BaseOptions(
      /// Connect server timeout in milliseconds
      connectTimeout: Duration.millisecondsPerMinute,

      /// The interval at which the data is received,
      /// before and afrer the response stream, in milliseconds
      receiveTimeout: Duration.millisecondsPerMinute,
      baseUrl: baseUrl,
      queryParameters: params,
      // contentType: ContentType.json.toString(),
      headers: {'content-type': 'application/json; charset=UTF-8'},
    );

    dio = Dio(options);

    if (interceptors?.isNotEmpty ?? false) {
      dio.interceptors.addAll(interceptors!);
    }

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
            responseBody: true,
            error: true,
            requestHeader: true,
            responseHeader: false,
            request: true,
            requestBody: true),
      );
    }
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? params,
    RequestOptions? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.get(/*baseUrl + */ url,
          queryParameters: params,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String url, {
    required body,
    Map<String, dynamic>? headers,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    assert(body != null);
    try {
      final response = await dio.post(
        url,
        data: body,
        options: options,
        queryParameters: params,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw Exception();
      } else {
        throw Exception();
      }
      // throw ServerException(ErrorResponseModel());
    }
  }
}
