import 'package:care_desk/src/Core/NetworkStructure/api_names.dart';

abstract class Networking<R, E> with ApiNames {
  final String _baseUrl = ApiNames.baseUrl;
  String get baseUrl => _baseUrl;

  void init();

  Future<R?> get({
    required String url,
    Map<String, String>? headers,
    bool auth = false,
  });
  Future<R?> post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool auth = false,
    bool showLoadingDialog = false,
  });

  // handle
  R? handleResponse({R? response, E? error});
}
