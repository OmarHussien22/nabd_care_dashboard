import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

class LauncherServices {
  LauncherServices._();

  static LauncherServices get instance => LauncherServices._();

  Future<void> launchToMail(String email) async {
    await launchUrl(Uri.parse('mailto:$email'));
  }

  Future<void> launchToSite(String site) async {
    if (await canLaunchUrl(Uri.parse(site))) {
      await launchUrl(Uri.parse(site));
    } else {
      throw 'Could not launch $site';
    }
  }
  // Future<void> launchToSite(String widget) async {
  //   final url = widget;
  //   var uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future<void> launchToWhatsApp(String phone) async {
    final url = Uri.parse("whatsapp://send?phone=$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
    // await launchUrl(Uri.parse('https://wa.me/$phone'));
  }

  Future<void> launchToPhone(String phone) async {
    await launchUrl(Uri.parse('tel:$phone'));
  }

  void launchYoutube({required String url}) async {
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(
          Uri.parse(url),
        );
      } else {
        if (await launchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static void launchMapApp({required String lat, required String lng}) async {
    var googleMapsLocationUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

    final encodedURl = Uri.encodeFull(googleMapsLocationUrl);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      throw 'Could not launch $encodedURl';
    }
  }

  Future<void> openFile(PlatformFile file) async {
    try {
      final String extension = file.name.split('.').last.toLowerCase();
      final bool isPdf = extension == 'pdf';
      final bool isVideo = ['mp4', 'mov', 'avi', 'mkv'].contains(extension);
      final bool isDoc = ['doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx'].contains(extension);
      final String? filePath = file.path;
      final bool hasHttpPath =
          filePath != null && (filePath.startsWith('http://') || filePath.startsWith('https://'));

      if (kIsWeb) {
        if (file.bytes != null) {
          String mimeType;
          if (isPdf) {
            mimeType = 'application/pdf';
          } else if (isVideo) {
            mimeType = 'video/${extension == 'mov' ? 'quicktime' : extension}';
          } else if (isDoc) {
            if (extension.startsWith('xls')) mimeType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
            else if (extension.startsWith('doc')) mimeType = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
            else mimeType = 'application/octet-stream';
          } else {
            mimeType = 'application/octet-stream';
          }

          final blob = html.Blob([file.bytes], mimeType);
          final url = html.Url.createObjectUrlFromBlob(blob);

          // Open in new tab. Browser will handle display for PDF/Video or download for others.
          html.window.open(url, '_blank');

          // Revoke after a delay to ensure it opens
          Future.delayed(const Duration(seconds: 1), () {
            html.Url.revokeObjectUrl(url);
          });
          return;
        }

        if (hasHttpPath) {
          html.window.open(filePath, '_blank');
        }
      } else {
        // Mobile/Desktop
        if (hasHttpPath) {
          final Uri uri = Uri.parse(filePath);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            debugPrint("Could not launch $uri");
          }
          return;
        }

        if (file.path != null) {
          final Uri uri = Uri.file(file.path!);
          // We use launchUrl with external application mode for best compatibility
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            debugPrint("Could not launch $uri");
          }
        }
      }
    } catch (e) {
      debugPrint("Error opening file: $e");
    }
  }

  Future<void> launchFile(PlatformFile file) async {
    await openFile(file);
  }

  Future<void> openPdfWeb(PlatformFile file) async {
    await openFile(file);
  }
}
