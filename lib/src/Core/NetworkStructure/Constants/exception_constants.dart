class ExceptionConstants {
  ExceptionConstants._();

  static final instance = ExceptionConstants._();

  final String badRequestException = 'ex_bad_request';
  final String unAuthorizedException = 'ex_unauthorized';
  final String forbiddenException = 'ex_forbidden';
  final String notFoundException = 'ex_not_found';
  final String methodNotAllowedException = 'ex_method_not_allowed';
  final String notAcceptableException = 'ex_not_acceptable';
  final String requestTimeoutException = 'ex_request_timeout';
  final String conflictException = 'ex_conflict';
  final String internalServerException = 'ex_internal_Server';
  final String notImplementedException = 'ex_not_implemented';
  final String badGatewayException = 'ex_bad_gateway';
  final String serviceUnavailableException = 'ex_service_unavailable';
  final String gatewayTimeoutException = 'ex_gateway_timeout';
  final String unKnownException = 'ex_unknown';
  final String networkDisconnectException = 'ex_network';
}
