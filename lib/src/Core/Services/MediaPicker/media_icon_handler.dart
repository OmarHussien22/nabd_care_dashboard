import 'package:flutter/material.dart';

class MediaIconHandler {
  MediaIconHandler._();
  static MediaIconHandler get instance => MediaIconHandler._();

  String _getExtension(String fileName) => fileName.split('.').last.toLowerCase();

  bool isPdf(String fileName) => _getExtension(fileName) == 'pdf';
  
  bool isVideo(String fileName) => 
      ['mp4', 'mov', 'avi', 'mkv'].contains(_getExtension(fileName));
  
  bool isExcel(String fileName) => 
      ['xls', 'xlsx'].contains(_getExtension(fileName));
  
  bool isWord(String fileName) => 
      ['doc', 'docx'].contains(_getExtension(fileName));

  IconData getIcon(String fileName) {
    if (isPdf(fileName)) return Icons.picture_as_pdf_rounded;
    if (isVideo(fileName)) return Icons.play_circle_outline_rounded;
    if (isExcel(fileName)) return Icons.table_chart_rounded;
    if (isWord(fileName)) return Icons.description_rounded;
    return Icons.insert_drive_file_rounded;
  }

  String getButtonTitle(String fileName) {
    if (isPdf(fileName)) return "open_pdf_in_browser";
    if (isVideo(fileName)) return "play_video";
    if (isExcel(fileName)) return "open_excel_sheet";
    if (isWord(fileName)) return "open_word_document";
    return "open_document";
  }
}
