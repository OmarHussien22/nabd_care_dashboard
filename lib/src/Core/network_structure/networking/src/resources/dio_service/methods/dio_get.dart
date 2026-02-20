part of 'imports_methods.dart';

class DioGet extends GetMethod {
  DioGet._();

  static final DioGet instance = DioGet._();

  Dio? _dio;

  injectDio(Dio value) {
    _dio = value;
  }

  final _dioResponseHandler = DioResponseHandler.instance;
  final _logger = NetworkLogger.instance;

  //<editor-fold desc="GET METHOD">
  @override
  Future<Response?> get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool auth = false,
    HeaderContentType? contentType,
  }) async {
    Response? response;
    var headerHandle = headers ?? HeaderHandler.instance.setHeaders(auth);
    printDM("get headers $headerHandle");
    _dio?.options.headers = headerHandle;
    if (contentType == HeaderContentType.json) {
      _dio?.options.contentType = 'application/json';
    }
    printDM("get headers ${_dio?.options.headers}");
    printDM('get Request $url');
    try {
      response = await _dio?.get(
        url,
        queryParameters: queryParams,
      );
      _logger.responseLog(response.toString());
    } on DioError catch (e) {
      return _dioResponseHandler.handleResponse(error: e);
    }
    return _dioResponseHandler.handleResponse(response: response);
  }

//</editor-fold>
}
