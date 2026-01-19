// import 'package:care_desk/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
// import 'package:care_desk/src/Core/Utils/SnackUtils/snack_utils.dart';
// import 'package:care_desk/src/Features/Auth/core/params/send_request_device_params.dart';
// import 'package:care_desk/src/Features/Auth/domain/use_cases/send_request_device_use_case.dart';

// import '../../../Super/Controllers/Resources/get/get_controller_interface.dart';

// class SendRequestDeviceController extends GetControllerInterface<void> {
//   void sendUserRequest({
//     required String phone,
//     String? deviceType,
//     String? deviceName,
//   }) async {
//     final SendRequestDeviceUseCase useCase = SendRequestDeviceUseCase();
//     state = await useCase(
//         params: SendRequestDeviceParams(
//             phone: phone, deviceType: deviceType, deviceName: deviceName))!;
//     if (state is DataSuccess) {
//       AppSnacks().showSnack(title: state.message, state: UtilState.success);
//     } else {
//       AppSnacks().showSnack(title: state.message, state: UtilState.error);
//     }
//   }

//   // @override
//   // void onInit() {
//   //   super.onInit();
//   // }
// }
