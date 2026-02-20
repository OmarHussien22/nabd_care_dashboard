import 'dart:io';

import 'package:care_desk/src/core/network_structure/exceptions/failure.dart';

class StatusHandler {
  StatusHandler._();
  static final instance = StatusHandler._();

  final Map<int, Exception> _statusCodeExceptions = {
    HttpStatus.badRequest: BadRequestException("Bad Request"),
    HttpStatus.forbidden: ForbiddenException("Forbidden"),
    HttpStatus.unauthorized: UnAuthorizedException("UnAuthorized"),
    HttpStatus.notFound: NotFoundException("Not Found"),
    HttpStatus.methodNotAllowed:
        MethodNotAllowedException("Method Not Allowed"),
    HttpStatus.notAcceptable: NotAcceptableException("Not Acceptable"),
    HttpStatus.requestTimeout: RequestTimeoutException("Request Timeout"),
    HttpStatus.conflict: ConflictException("Conflict"),
    HttpStatus.internalServerError:
        InternalServerException("Internal Server Error"),
    HttpStatus.notImplemented: NotImplementedException("Not Implemented"),
    HttpStatus.badGateway: BadGatewayException("Bad Gateway"),
    HttpStatus.serviceUnavailable:
        ServiceUnavailableException("Service Unavailable"),
    HttpStatus.gatewayTimeout: GatewayTimeoutException("Gateway Timeout"),
  };

  final _defaultException = UnKnownException("Unknown Error");

  void handleStatusCode(int statusCode) {
    if (_statusCodeExceptions.containsKey(statusCode)) {
      throw _statusCodeExceptions[statusCode] ?? _defaultException;
    } else {
      throw _defaultException;
    }
  }
}
