import 'package:dio/dio.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Networking/src/Interfaces/Handler/response_handler.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Networking/src/Resources/DioService/Handler/dio_error_handler.dart';

class DioResponseHandler implements ResponseHandler<Response, DioError> {
  DioResponseHandler._();

  static final DioResponseHandler instance = DioResponseHandler._();

  final _errorHandler = DioErrorHandler.instance;
  @override
  Response? handleResponse({Response? response, DioError? error}) {
    if (error != null) {
      _errorHandler.handleError(error);
    } else {
      return response;
    }
    return null;
  }
}
