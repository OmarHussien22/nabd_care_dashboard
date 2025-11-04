abstract class GetMethod<R>{
  Future<R?> get({
    required String url,
    Map<String, String>? headers,
    bool auth = false,
  });
}