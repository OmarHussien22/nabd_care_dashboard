import 'package:dio/dio.dart';
import 'package:care_desk/src/Core/NetworkStructure/Constants/exception_constants.dart';
import 'package:care_desk/src/Core/NetworkStructure/DataSource/service_caller.dart';
import 'package:care_desk/src/Core/NetworkStructure/Networking/network_service.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';

import '../Exceptions/failure.dart';
import '../Params/params.dart';
import '../api_names.dart';

enum CrudType {
  post,
  get,
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

  Future<Response> call(
    String url, {
    bool auth = false,
    bool forceRefresh = false,
    bool showLoadingDialog = false,
    required CrudType type,
    Map<String, String>? headers,
    Params? params,
    Map<String, dynamic>? details,
  }) async {
    Response? response;
    try {
      switch (type) {
        case CrudType.post:
          response = await _networkService.post(
            url: url,
            auth: auth,
            headers: headers,
            body: params?.toJson() ?? {},
            queryParams: params?.query() ?? {},
            showLoadingDialog: showLoadingDialog,
          );
          break;
        case CrudType.get:
          response = await _networkService.get(
            url: url,
            auth: auth,
            headers: headers,
            queryParams: params?.query() ?? {},
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
}
