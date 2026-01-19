// import 'dart:async';
//
// import 'package:care_desk/src/Core/Utils/general_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
//
// class VerificationCodeController extends GetControllerInterface {
//   TextEditingController? textEditingController;
//   StreamController<ErrorAnimationType>? errorController;
//   // VerifyPhoneController verifyPhoneController = Get.put(VerifyPhoneController());
//   final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
//   late Timer _timer;
//   int countDownTimer = 59;
//
//   void startTimer() {
//     const oneSec = Duration(seconds: 1);
//     countDownTimer = 59;
//     _timer = Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         printDM("timer started : countDownTimer = $countDownTimer");
//         if (countDownTimer == 0) {
//           timer.cancel();
//           update();
//         } else {
//           countDownTimer--;
//           update();
//         }
//       },
//     );
//   }
//
//   void submit() async {
//     if (globalKey.currentState!.validate()) {
//       globalKey.currentState!.save();
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     textEditingController = TextEditingController();
//     errorController = StreamController<ErrorAnimationType>();
//     startTimer();
//   }
//
//   @override
//   void onClose() {
//     // errorController!.close();
//     // textEditingController!.dispose();
//     _timer.cancel();
//     super.dispose();
//   }
// }
