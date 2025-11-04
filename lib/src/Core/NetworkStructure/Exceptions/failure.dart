
class Failure implements Exception {

  Failure([this._message, this._prefix]);

  final dynamic _message;
  final dynamic _prefix;
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class BadRequestException extends Failure {
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

class ForbiddenException extends Failure {
  ForbiddenException([String? message]) : super(message, "Forbidden: ");
}

class UnAuthorizedException extends Failure {
  UnAuthorizedException([String? message]) : super(message, "UnAuthorized: ");
}
class NotFoundException extends Failure {
  NotFoundException([String? message]) : super(message, "Not Found: ");
}
class MethodNotAllowedException extends Failure {
  MethodNotAllowedException([String? message])
      : super(message, "Method Not Allowed: ");
}

class NotAcceptableException extends Failure {
  NotAcceptableException([String? message]) : super(message, "Not Acceptable: ");
}

class RequestTimeoutException extends Failure {
  RequestTimeoutException([String? message]) : super(message, "Request Timeout: ");
}

class ConflictException extends Failure {
  ConflictException([String? message]) : super(message, "Conflict: ");
}

class InternalServerException extends Failure {
  InternalServerException([String? message])
      : super(message, "Internal Server Error: ");
}

class NotImplementedException extends Failure {
  NotImplementedException([String? message]) : super(message, "Not Implemented: ");
}

class BadGatewayException extends Failure {
  BadGatewayException([String? message]) : super(message, "Bad Gateway: ");
}

class ServiceUnavailableException extends Failure {
  ServiceUnavailableException([String? message])
      : super(message, "Service Unavailable: ");
}

class GatewayTimeoutException extends Failure {
  GatewayTimeoutException([String? message]) : super(message, "Gateway Timeout: ");
}

class UnKnownException extends Failure {
  UnKnownException([String? message]) : super(message, "UnKnown: ");
}

class TimeoutRequestException extends Failure {
  TimeoutRequestException([String? message]) : super(message, "Timeout Request: ");
}

class NetworkDisconnectException extends Failure {
  NetworkDisconnectException([String? message])
      : super(message, "Network Disconnect: ");
}












//
// class FetchDataException extends NetworkException {
//   FetchDataException([String? message])
//       : super(message, "Error During Communication: ");
// }
//
// class BadRequestException extends NetworkException {
//   BadRequestException([String? message]) : super(message, "Invalid Request: ");
// }
//
// class UnauthorisedException extends NetworkException {
//   UnauthorisedException([String? message]) : super(message, "Unauthorised: ");
// }
//
// class ForbiddenException extends NetworkException {
//   ForbiddenException([String? message]) : super(message, "Forbidde: ");
// }
//
// class InvalidInputExc_eption extends NetworkException {
//   InvalidInputException([String? message]) : super(message, "Invalid Input: ");
// }
//
// class ServerSideException extends NetworkException {
//   ServerSideException([String? message]) : super(message, "Server side: ");
// }
//
//
// class NotFoundException extends NetworkException {
//   NotFoundException([String? message]) : super(message, "Server side: ");
// }
//
//
//
//
//
// class UnAuthorizedException extends NetworkException {
//   UnAuthorizedException([String? message]) : super(message, "Server side: ");
// }
//
//
// class UnKnownException extends NetworkException {
//   UnKnownException([String? message]) : super(message, "Server side: ");
// }
//
//
//
// class NetworkDisconnectException extends NetworkException {
//   NetworkDisconnectException([String? message]) : super(message, "Server side: ");
// }
//
