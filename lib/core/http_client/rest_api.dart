import 'package:clutter/core/http_client/request_model.dart';
import 'package:dio/dio.dart';

enum HttpAction {
  get,
  getBinary,
  post,
  put,
  delete,
}

abstract class RestAPI {
  Future<Response> get(
    url, {
    dynamic data,
    Map<String, dynamic> params,
    bool cache = false,
    Options options,
  });

  Future<Response> post(url, {dynamic data});

// Future<Response> put(url, {dynamic data});
// Future<Response> delete(url, {dynamic data});
}

abstract class ClutterService<T> {
  final String url;

  // TODO base url needs to have a value
  final String baseUrl = '';
  final HttpAction httpAction;
  final bool isCached;
  late RestAPI restAPI;

  ClutterService({
    required this.url,
    required this.httpAction,
    this.isCached = false,
  }) : assert(url.isNotEmpty) {
    // TODO fix the following
    // restAPI = Set To something
    // restAPI = response;
  }

  Future<T> request({RequestModel? data}) async {
    String? jsonData;
    try {
      jsonData = data?.toString();
    } on Error catch (e) {
      throw e.stackTrace.toString();
      // return Future.value();
    }

    Response response;
    try {
      switch (httpAction) {
        case HttpAction.get:
          response = await restAPI.get(jsonData, cache: isCached);
          break;
        case HttpAction.getBinary:
          // TODO: Handle this case.
          break;
        case HttpAction.post:
          response = await restAPI.post(url, data: jsonData);
          break;
        case HttpAction.put:
          // TODO: Handle this case.
          break;
        case HttpAction.delete:
          // TODO: Handle this case.
          break;
        default:
          throw 'Service not implemented';
          break;
      }
    } on Error catch (e) {
      throw e.stackTrace.toString();
      // return null;
    }
    return Future.value();
  }

  Future<Response> getFromAPI(url, {dynamic data, Map<String, dynamic>? params}) async {
    Future<Response> response = restAPI.get(
      baseUrl + url,
      params: params ?? {},
      options: Options(
        responseType: ResponseType.json,
      ),
    );
    return response;
  }
}
