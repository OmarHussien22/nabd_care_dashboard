import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../interfaces/networking.dart';
import 'handler/dio_response_handler.dart';
import 'methods/imports_methods.dart';
import '../../utils/network_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../data_source/service_interface.dart';

///change _apiToken later :

class DioService extends Networking<Response, DioError> {
  DioService._();

  static final _instance = DioService._();

  factory DioService() => _instance;

  Dio _dio = Dio();

  final DioGet _get = DioGet.instance;
  final DioPost _post = DioPost.instance;

  //<editor-fold desc="INIT DIO SERVICE">
  /// called once at [main.dart]
  @override
  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: kConnectTimeout,
        receiveTimeout: kReceiveTimeout,
        sendTimeout: kSendTimeout,
      ),
    );
    // _dio.interceptors.add(
    //   LogInterceptor(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: true,
    //     error: true,
    //   ),
    // );

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
            requestBody: true,
            requestHeader: true,
            // maxLines: 80,
            logPrint: (obj) {
              log(obj.toString(), name: "dio_service");
            }),
      );
    }
    _get.injectDio(_dio);
    _post.injectDio(_dio);
  }

  //</editor-fold>

  //<editor-fold desc="GET METHOD">
  @override
  Future<Response?> get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool auth = false,
    HeaderContentType? contentType,
  }) async {
    return _get.get(
      url: url,
      auth: auth,
      headers: headers,
      queryParams: queryParams,
      contentType: contentType,
    );
  }

  //</editor-fold>

  //<editor-fold desc="POST METHOD">
  @override
  Future<Response?> post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    bool auth = false,
    bool withPagination = false,
    bool showLoadingDialog = false,
    HeaderContentType? contentType,
  }) async {
    return _post.post(
      url: url,
      headers: headers,
      withPagination: withPagination,
      body: body,
      auth: auth,
      queryParams: queryParams,
      showLoadingDialog: showLoadingDialog,
      contentType: contentType,
    );
  }

  //</editor-fold>

  // <editor-fold desc="Handle Response METHOD">
  @override
  Response? handleResponse({Response? response, DioError? error}) =>
      DioResponseHandler.instance
          .handleResponse(response: response, error: error);
//</editor-fold>
}
