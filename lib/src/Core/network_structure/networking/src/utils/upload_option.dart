
import 'package:dio/dio.dart';

class UploadOptions {
  final ProgressCallback? onSendProgress;
  final CancelToken? cancelToken;

  UploadOptions({
    this.onSendProgress,
    this.cancelToken,
  });
}