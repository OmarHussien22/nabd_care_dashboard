// import 'package:getx_base_code/src/Core/Services/Firebase/phone_verify_service.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../../../Features/Auth/presentation/manger/verify_phone_controller.dart';
// import '../../Constants/Enums/phone_verify_enum.dart';
// import '../../Utils/general_utils.dart';

// class PhoneVerifyHandler {
//   PhoneVerifyHandler._();
//   static final PhoneVerifyHandler instance = PhoneVerifyHandler._();
//   GetStorage box = GetStorage();
//   final VerifyPhoneController _verifyPhoneController =
//       Get.put(VerifyPhoneController());
//   phoneVerify({required String phone, Function()? onSuccess}) {
//     if (box.read("phone_verified") == 0 &&
//         phoneVerifyRequired == PhoneVerifyEnum.WithVerify) {
//       PhoneVerifyService.verifyPhone(
//         phone: phone,
//         onSuccess: () async {
//           // await _verifyPhoneController.verifyPhone(
//           //   onSuccess: onSuccess!() != null ? onSuccess() : () {},
//           // );
//         },
//       );
//     } else {
//       if (onSuccess != null) onSuccess();
//     }
//   }
// }
