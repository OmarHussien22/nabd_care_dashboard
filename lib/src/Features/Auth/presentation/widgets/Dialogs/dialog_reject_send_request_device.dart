// import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
// import 'package:care_desk/src/Core/Utils/general_utils.dart';
// import 'package:care_desk/src/Features/Auth/presentation/manger/send_request_device_controller.dart';
// import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
// import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/src/imports_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DialogRejectSendRequestDevice extends StatelessWidget {
//   final String phone;
//   final String? deviceType;
//   final String? deviceId;
//   const DialogRejectSendRequestDevice({
//     super.key,
//     required this.phone,
//     this.deviceType,
//     this.deviceId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final SendRequestDeviceController controller =
//         Get.put(SendRequestDeviceController());
//     return Dialog(
//       child: SizedBox(
//         height: 200.toH(),
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 15.toW(),
//             vertical: 25.toH(),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               15.ESH(),
//               const CustomText(
//                 "request_reject_retry_send",
//                 textAlign: TextAlign.center,
//                 fontSize: 14,
//               ),
//               20.ESH(),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ButtonDefault(
//                       title: "resend_request",
//                       height: 50.toH(),
//                       titleSize: 12,
//                       onPressed: () {
//                         printDM("send request device is okay");
//                         Get.back();
//                         controller.sendUserRequest(
//                           phone: phone,
//                           deviceType: deviceType,
//                           deviceName: deviceId,
//                         );
//                       },
//                     ),
//                   ),
//                   5.ESW(),
//                   Expanded(
//                     child: ButtonDefault(
//                       title: "cancel",
//                       titleSize: 12,
//                       height: 50.toH(),
//                       onPressed: () {
//                         Get.back();
//                       },
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
