// import 'dart:convert';

// import 'package:getx_base_code/src/Core/Services/DynamicLink/dynamic_link_interface.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';

// import '../../Utils/general_utils.dart';
// import 'HandleNotification/Factory/dynamic_link_factory.dart';

// class DynamicLinkImplementation implements DynamicLinkInterface {
//   DynamicLinkImplementation._();
//   static DynamicLinkImplementation instance = DynamicLinkImplementation._();
//   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

//   @override
//   Future<Uri?> getInitialLink() async {
//     final PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
//     return data?.link;
//   }

//   @override
//   Future<String> createDynamicLink({
//     required bool short,
//     required int id,
//     required String title,
//     required String description,
//     required String image,
//     Object? advertiseModel,
//   }) async {
//     printDM("image is $image");
//     String uriPrefix =
//         'https://moawda.page.link'; //change it to your domain name from firebase
//     Map<String, String> data = {}; //! change it to your encoded data
//     // Map<String, String> data = {"model": jsonEncode(advertiseModel!.toMap())};

//     String link = '$uriPrefix/?${jsonEncode(data)}';
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: uriPrefix,
//       link: Uri.parse(link),
//       androidParameters: const AndroidParameters(
//         packageName: '',
//         minimumVersion: 1,
//       ),
//       iosParameters: const IOSParameters(
//         bundleId: '',
//         minimumVersion: '1',
//         appStoreId: '1660636889',
//       ),
//       socialMetaTagParameters: SocialMetaTagParameters(
//         title: title,
//         description: description,
//         imageUrl: Uri.parse(image),
//       ),
//     );

//     Uri url;
//     if (short) {
//       final ShortDynamicLink shortLink =
//           await dynamicLinks.buildShortLink(parameters);
//       url = shortLink.shortUrl;
//     } else {
//       url = await dynamicLinks.buildLink(parameters);
//     }
//     Share.share(url.toString());
//     String dynamicLink = url.toString();
//     printDM("dynamic link is $dynamicLink");
//     return dynamicLink;
//   }

//   @override
//   Future<void> retrieveDynamicLink({VoidCallback? onFailed}) async {
//     try {
//       final PendingDynamicLinkData? data =
//           await FirebaseDynamicLinks.instance.getInitialLink();
//       final Uri? deepLink = data?.link;

//       if (deepLink != null) {
//         final queryParams = deepLink.queryParameters;
//         printDM("queryParams is $queryParams");
//         queryParams.forEach(
//           (key, value) {
//             var decodedModel = jsonDecode(key);
//             var model = decodedModel['model'];
//             var decodedModelData = jsonDecode(model);
//             DynamicLinkFactory.instance
//                 .switchType(deepLink.path)
//                 .onDynamicLinkRedirect(
//                   decodedModelData,
//                 );
//           },
//         );
//       } else {
//         onFailed!();
//       }
//       FirebaseDynamicLinks.instance.onLink.listen((event) {
//         printDM("event is $event");
//         final Uri deepLink = event.link;
//         if (deepLink != null) {
//           final queryParams = deepLink.queryParameters;
//           queryParams.forEach((key, value) {
//             var decodedModel = jsonDecode(key);
//             var model = decodedModel['model'];
//             var decodedModelData = jsonDecode(model);
//             DynamicLinkFactory.instance
//                 .switchType(deepLink.path)
//                 .onDynamicLinkRedirect(
//                   decodedModelData,
//                 );
//           });
//         } else {
//           onFailed!();
//           printDM("deepLink is null");
//         }
//       });
//     } catch (e) {
//       printDM('error is $e');
//     }
//   }
// }
