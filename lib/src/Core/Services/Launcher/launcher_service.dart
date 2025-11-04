import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

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
    var googleMapsLocationUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

    final encodedURl = Uri.encodeFull(googleMapsLocationUrl);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      throw 'Could not launch $encodedURl';
    }
  }
}
// abstract class LauncherServices{
//   static Future<void>launchToMail(String email)async{
//     await launchUrl(Uri.parse('mailto:$email'));
//   }
//   static  Future<void> launchToSite(String site)async{
//
//     if (await canLaunchUrl(Uri.parse(site))) {
//       await launchUrl(Uri.parse(site));
//     } else {
//       throw 'Could not launch $site';
//     }
//    }
//   static  Future<void> launchToWhatsApp(String phone)async{
//     final url = Uri.parse("whatsapp://send?phone=$phone");
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//     // await launchUrl(Uri.parse('https://wa.me/$phone'));
//   }
//   static  Future<void>launchToPhone(String phone)async{
//     await launchUrl(Uri.parse('tel:$phone'));
//   }
//   static void launchYoutube({required String url}) async {
//     if (Platform.isIOS) {
//       if (await canLaunchUrl(Uri.parse(url))) {
//         await launchUrl(Uri.parse(url),  );
//       } else {
//         if (await launchUrl(Uri.parse(url))) {
//           await launchUrl(Uri.parse(url));
//         } else {
//           throw 'Could not launch $url';
//         }
//       }
//     } else {
//       if (await canLaunchUrl(Uri.parse(url))) {
//         await launchUrl(Uri.parse(url));
//       } else {
//         throw 'Could not launch $url';
//       }
//     }
//   }
// }
