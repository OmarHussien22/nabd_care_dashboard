import 'dart:io';

import 'package:care_desk/src/Features/Patients/presentation/widgets/file_upload_card.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class UploadAttachment {
  final GetFile getFile;
  final String name;
  final String size;

  double progress;
  FileUploadState state;
  CancelToken? cancelToken;
  UploadAttachment({
    required this.name,
    required this.getFile,
    required this.size,
    this.progress = 0.0,
    this.state = FileUploadState.uploading,
    this.cancelToken,
  });

  
  // File? getFile() {
  //   if (file != null) return file;
  //   return File(platformFile.path!);
  // }
}

class GetFile {
  final File? file;
  final PlatformFile? platformFile;
  GetFile({this.file,  this.platformFile});
}