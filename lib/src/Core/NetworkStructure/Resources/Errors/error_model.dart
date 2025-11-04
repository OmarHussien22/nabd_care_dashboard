import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';

class ErrorModel {
  String title;
  bool? status;
  String? message;
  final ErrorType type;

  ErrorModel({
    required this.title,
    required this.type,
    this.message,
    this.status,
  }) {
    message = message?.toTr();
    title = title.toTr();
    status = status;
  }
}

enum ErrorType {
  serverSide,
  networkConnection,
  dataEmpty,
  dirtyData,
  statusFalse,
  unKnown,
}

// error model
