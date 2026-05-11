import 'package:dio/dio.dart';
import 'package:care_desk/src/Core/network_structure/networking/src/interfaces/handler/response_handler.dart';
import 'package:care_desk/src/Core/network_structure/networking/src/resources/dio_service/handler/dio_error_handler.dart';

import '../../../../../../utils/general_utils.dart' show printDM;
import 'un_auth_handeler.dart';

class DioResponseHandler implements ResponseHandler<Response, DioError> {
  DioResponseHandler._();

  static final DioResponseHandler instance = DioResponseHandler._();

  final _errorHandler = DioErrorHandler.instance;
  @override
  Response? handleResponse({Response? response, DioError? error}) {
    if (response?.statusCode == 401 ||
        response?.statusCode == 302 ||
        response?.statusCode == 403) {
      printDM("UnAuthHandler >> ${response?.statusCode}");
    
      UnAuthHandler().handleUnAuth();
      return null;
      // } else if (response?.statusCode == 403) {
      //   printDM("Forbidden access >> ${response?.statusCode}");
      //   UnAuthHandler().handelBlockUser();
      //   return null;
    }
    if (error != null) {
      _errorHandler.handleError(error);
    } else {
      return response;
    }
    return null;
  }
}
