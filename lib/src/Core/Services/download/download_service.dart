import 'package:file_picker/file_picker.dart';
import 'package:universal_html/html.dart' as html;

class DownloadService {
  DownloadService._();

  static DownloadService get instance => DownloadService._();

  void downloadPdfWeb(PlatformFile file) {
    final blob = html.Blob([file.bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", file.name)
      ..click();

    html.Url.revokeObjectUrl(url);
  }
}