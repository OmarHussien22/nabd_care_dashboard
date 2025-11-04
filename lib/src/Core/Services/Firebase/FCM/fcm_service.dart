import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';

import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Text/src/imports_text.dart';

class FCMService {
  // static final NotificationFactory _creator = NotificationFactory.instance;
  // static late final FirebaseMessaging _messaging;
  // static Future<String?> get deviceToken async {
  //   final FirebaseMessaging fcm = FirebaseMessaging.instance;
  //   String? deviceToken = '';
  //   try {
  //     deviceToken = await fcm.getToken();
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('an error occur in fetch token');
  //     }
  //   }
  //   if (kDebugMode) {
  //     print("device Token is => $deviceToken");
  //   }
  //   return deviceToken;
  // }

  static void showSnack({required String message}) {
    GetSnackBar(
      padding: EdgeInsets.zero,
      messageText: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomText(
                message,
                color: AppColors.get.black,
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
      ),
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(vertical: 150.toH(), horizontal: 8.toW()),
      borderRadius: 10,
      backgroundColor: AppColors.get.primary,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      animationDuration: const Duration(milliseconds: 500),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 3),
        ),
      ],
    ).show();
  }

  static void firebaseNotificationConfiguration(
      {VoidCallback? onNotificationSent}) async {
    // _messaging = FirebaseMessaging.instance;
    // NotificationSettings settings = await _messaging.requestPermission(
    //   alert: true,
    //   badge: true,
    //   provisional: false,
    //   sound: true,
    // );

    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //     printDM('#### Notification: ${message.data}');
    //
    //     final notificationMessage = NotificationMessage.fromMap(message.data);
    //
    //     LocalNotificationService.launchNotification(
    //         message: notificationMessage);
    //     showSnack(message: notificationMessage.title);
    //     Utils.unSeenNotification();
    //     // onNotificationSent!();
    //     /// on success
    //     // final NotificationBadgeController numbersController = Get.find();
    //     // numbersController.increaseCounts();
    //
    //     /// ----------
    //   });
    // } else {
    //   if (kDebugMode) {
    //     print("permission declined by user");
    //   }
    // }
  }
}
