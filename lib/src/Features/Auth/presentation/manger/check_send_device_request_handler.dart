// import 'dart:io';

// import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
// import 'package:getx_base_code/src/Features/Auth/presentation/widgets/Dialogs/dialog_pending_send_request_device.dart';
// import 'package:getx_base_code/src/Features/Auth/presentation/widgets/Dialogs/dialog_reject_send_request_device.dart';
// import 'package:getx_base_code/src/Features/Auth/presentation/widgets/Dialogs/dialog_send_request_device.dart';
// import 'package:getx_base_code/src/Shared/Caches/user_cache.dart';
// import 'package:getx_base_code/src/Shared/Managers/user_controller.dart';
// import 'package:get/get.dart';

// class CheckSendDeviceRequestHandler {
//   static Future<void> checkSendDeviceRequest({
//     required Function onSuccess,
//     required String phone,
//     required String? deviceType,
//     required String? deviceId,
//   }) async {
//     if(GetVersionClass.getAndroidVersion()){
//       if (!Platform.isIOS) {
//         final LocalAuthentication auth = LocalAuthentication();
//         bool isBiometricSupported = false;
//         try {
//           bool isSupported = await auth.isDeviceSupported();
//           isBiometricSupported = isSupported;
//         } catch (e) {
//           printDM("error from send request $e");
//         }
//         //  UserCache().data?.isDeviceEmulator == DEFAULT
//         if (UserController.get.user?.isDeviceEmulator == DEFAULT) {
//           if (isBiometricSupported == false) {
//             Get.dialog(
//               DialogSendRequestDevice(
//                 phone: phone,
//                 deviceType: deviceType,
//                 deviceId: deviceId,
//               ),
//             );
//           } else {
//             onSuccess();
//           }
//         } else if (UserController.get.user?.isDeviceEmulator == PENDING) {
//           Get.dialog(const DialogPendingSendRequestDevice());
//         } else if (UserController.get.user?.isDeviceEmulator == REJECTED) {
//           Get.dialog(
//             DialogRejectSendRequestDevice(
//               phone: phone,
//               deviceType: deviceType,
//               deviceId: deviceId,
//             ),
//           );
//         } else {
//           onSuccess();
//         }
//       }
//       else {
//         onSuccess();
//       }
//     }
//     else {
//       onSuccess();
//     }
//   }
// }
