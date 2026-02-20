import 'package:care_desk/src/Core/network_structure/networking/network_service.dart';
import 'package:dio/dio.dart';
import 'package:care_desk/src/core/network_structure/constants/exception_constants.dart';
import 'package:care_desk/src/core/network_structure/data_source/service_caller.dart';
import 'package:care_desk/src/core/utils/general_utils.dart';

import '../exceptions/failure.dart';
import 'package:care_desk/src/core/network_structure/params/params.dart';
import '../api_names.dart';

enum CrudType {
  post,
  get,
}

enum HeaderContentType {
  json,
  formData,
}

void _printUrl(String value, {required String url}) {
  printDM(
    value,
    name: url.substring(
      ApiNames.baseUrl.length,
    ),
  );
}

abstract class ServicesInterface with ApiNames implements ServiceCaller {
  final _networkService = NetworkService();
  late CrudType type;
  late bool withPagination;
  late bool showLoadingDialog;

  Future<Response> call(
    String url, {
    bool auth = false,
    bool forceRefresh = false,
    bool showLoadingDialog = false,
    bool withPagination = false,
    required CrudType type,
    Map<String, String>? headers,
    Params? params,
    Map<String, dynamic>? details,
    HeaderContentType? contentType,
  }) async {
    setData(
      type: type,
      showLoadingDialog: showLoadingDialog,
      withPagination: withPagination,
    );
    Response? response;
    // if (AppSettings.appMode == AppMode.dev&&type==CrudType.post&&showLoadingDialog) {
    //   AppDialogs.showLoadingDialog();
    //   await Future.delayed(const Duration(seconds: 3), () {
    //     AppDialogs.closeOpenDialogs();
    //   });
    // }
    try {
      switch (type) {
        case CrudType.post:
          response = await _networkService.post(
            url: url,
            auth: auth,
            headers: headers,
            withPagination: withPagination,
            body: params?.toJson() ?? {},
            queryParams: params?.query() ?? {},
            showLoadingDialog: showLoadingDialog,
            contentType: contentType,
          );
          break;
        case CrudType.get:
          response = await _networkService.get(
            url: url,
            auth: auth,
            headers: headers,
            queryParams: params?.query() ?? {},
            contentType: contentType,
          );
          break;
      }
    } on BadRequestException {
      _printUrl('BadRequestException >> ${response?.statusCode}', url: url);
      throw BadRequestException(
          ExceptionConstants.instance.badRequestException);
    } on ForbiddenException {
      _printUrl('ForbiddenException >> ${response?.statusCode}', url: url);
      throw ForbiddenException(ExceptionConstants.instance.forbiddenException);
    } on NetworkDisconnectException {
      _printUrl('NetworkDisconnectException >> ${response?.statusCode}',
          url: url);
      throw NetworkDisconnectException(
          ExceptionConstants.instance.networkDisconnectException);
    } on UnAuthorizedException {
      _printUrl('UnAuthorizedException >> ${response?.statusCode}', url: url);
      throw UnAuthorizedException(
          ExceptionConstants.instance.unAuthorizedException);
    } on NotFoundException {
      _printUrl('NotFoundException >> ${response?.statusCode}', url: url);
      throw NotFoundException(ExceptionConstants.instance.notFoundException);
    } on MethodNotAllowedException {
      _printUrl('MethodNotAllowedException >> ${response?.statusCode}',
          url: url);
      throw MethodNotAllowedException(
          ExceptionConstants.instance.methodNotAllowedException);
    } on NotAcceptableException {
      _printUrl('NotAcceptableException >> ${response?.statusCode}', url: url);
      throw NotAcceptableException(
          ExceptionConstants.instance.notAcceptableException);
    } on RequestTimeoutException {
      _printUrl('RequestTimeoutException >> ${response?.statusCode}', url: url);
      throw RequestTimeoutException(
          ExceptionConstants.instance.requestTimeoutException);
    } on ConflictException {
      _printUrl('ConflictException >> ${response?.statusCode}', url: url);
      throw ConflictException(ExceptionConstants.instance.conflictException);
    } on InternalServerException {
      _printUrl('InternalServerException >> ${response?.statusCode}', url: url);
      throw InternalServerException(
          ExceptionConstants.instance.internalServerException);
    } on NotImplementedException {
      _printUrl('NotImplementedException >> ${response?.statusCode}', url: url);
      throw NotImplementedException(
          ExceptionConstants.instance.notImplementedException);
    } on BadGatewayException {
      _printUrl('BadGatewayException >> ${response?.statusCode}', url: url);
      throw BadGatewayException(
          ExceptionConstants.instance.badGatewayException);
    } on ServiceUnavailableException {
      _printUrl('ServiceUnavailableException >> ${response?.statusCode}',
          url: url);
      throw ServiceUnavailableException(
          ExceptionConstants.instance.serviceUnavailableException);
    } on GatewayTimeoutException {
      _printUrl('GatewayTimeoutException >> ${response?.statusCode}', url: url);
      throw GatewayTimeoutException(
          ExceptionConstants.instance.gatewayTimeoutException);
    } on UnKnownException {
      _printUrl('UnKnownException >> ${response?.statusCode}', url: url);
      throw UnKnownException(ExceptionConstants.instance.unKnownException);
    }
    if (response != null) {
      _printUrl(
          'response is not null ${response.data} - ${response.statusCode}',
          url: url);
      return response;
    } else {
      printDM('response is null', name: 'ServicesInterface');
      throw UnKnownException(ExceptionConstants.instance.unKnownException);
    }
  }

  setData({
    required CrudType type,
    required bool showLoadingDialog,
    required bool withPagination,
  }) {
    this.type = type;
    this.showLoadingDialog = showLoadingDialog;
    this.withPagination = withPagination;
  }
}
