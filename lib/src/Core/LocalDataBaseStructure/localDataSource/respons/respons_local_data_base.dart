import 'dart:convert';

class LocalResponse<T> {
  LocalResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  final T? data;
  final int? statusCode;
  final String? statusMessage;

  @override
  String toString() {
    return jsonEncode({
      'statusCode': statusCode,
      'statusMessage': statusMessage,
      'data': data,
    });
  }
}
