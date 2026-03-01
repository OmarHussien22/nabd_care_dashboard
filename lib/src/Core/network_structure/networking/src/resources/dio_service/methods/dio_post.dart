part of 'imports_methods.dart';


class DioPost extends PostMethod {
  DioPost._();

  static final DioPost instance = DioPost._();

  Dio? _dio;

  injectDio(Dio value) {
    _dio = value;
  }

  final _dioResponseHandler = DioResponseHandler.instance;
  final _logger = NetworkLogger.instance;
  final _utils = NetworkUtils.instance;

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
    UploadOptions? uploadOptions,
    }) async {
    body ??= {};
    if(withPagination) {
      body.addAll({"with_pagination": withPagination ? 1 : 0});
    }

    _utils.showDialog(showLoadingDialog);
    FormData formData = FormData.fromMap(body);
    bool containFile = false;
    _handleFiles(body, (form, hasFile) {
      containFile = hasFile;
      formData = form;
    });
    Response? response;
    _logger.logSentBody(body);
    _dio?.options.headers = headers ?? HeaderHandler.instance.setHeaders(auth);
    if(contentType == HeaderContentType.json){
      _dio?.options.contentType = 'application/json';
    }
    printDM("post headers ${_dio?.options.headers}");
    if (containFile) {
      _dio?.options.contentType = 'multipart/form-data';
      // _dio?.options.contentType = 'application/json';
    }
    printDM('post Request $url');
    try {
      response = await _dio?.post(
        url,
        data: contentType == HeaderContentType.json ?body:formData,
        queryParameters: queryParams,
        onSendProgress: uploadOptions?.onSendProgress,
        cancelToken: uploadOptions?.cancelToken,
        options: Options(
            followRedirects: false,
            headers: headers ?? HeaderHandler.instance.setHeaders(auth),
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      _logger.responseLog(response.toString());
      _utils.closeDialog(showLoadingDialog);
    } on DioError catch (e) {
      _utils.closeDialog(showLoadingDialog);
      _logger.errorLog(e);
      return _dioResponseHandler.handleResponse(error: e);
    }
    return _dioResponseHandler.handleResponse(response: response);
  }

  void _handleFiles(Map<String, dynamic> body, Function(FormData, bool) onFileExist) {
    FormData formData = FormData.fromMap(body);
    bool containFile = false;
    body.forEach((key, value) {
      if ((value) is File) {
        containFile = true;
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(
            value.path,
            filename: value.path.split("/").last,
          ),
        );
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        containFile = true;
        for (var element in value) {
          formData.files.add(
            MapEntry(
              '$key[]',
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ),
            ),
          );
        }
      }
    });
    onFileExist(formData, containFile);
  }

//</editor-fold>
}
