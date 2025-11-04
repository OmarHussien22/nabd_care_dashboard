import 'package:dio/dio.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Exceptions/failure.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Networking/src/Interfaces/Handler/error_handler.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Networking/src/Utils/status_handler.dart';

class DioErrorHandler extends ErrorHandler<DioError> {
  DioErrorHandler._();

  static final DioErrorHandler instance = DioErrorHandler._();

  @override
  void handleError(DioError error) {
    if (error.response.toString().contains("SocketException")) {
      throw NetworkDisconnectException('Network Disconnect Exception');
    } else {
      _handleError(error);
    }
  }

  void _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        throw TimeoutRequestException('Connection Timeout');
      case DioErrorType.sendTimeout:
        throw TimeoutRequestException('Send Timeout');
      case DioErrorType.receiveTimeout:
        throw TimeoutRequestException('Receive Timeout');
      case DioErrorType.response:
        StatusHandler.instance
            .handleStatusCode(error.response?.statusCode ?? 0);
        break;
      case DioErrorType.cancel:
        throw TimeoutRequestException('Request Cancelled');
      case DioErrorType.other:
        throw UnKnownException('Unknown Error');
      default:
        throw UnKnownException('Unknown Error');
    }
  }
}
