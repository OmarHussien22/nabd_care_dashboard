// import 'package:getx_base_code/src/Core/Utils/SnackUtils/snack_utils.dart';
// import 'package:getx_base_code/src/Features/Auth/core/params/set_user_info_params.dart';
// import 'package:getx_base_code/src/Features/Statics/presentation/controller/log_out_controller.dart';
// import 'package:getx_base_code/src/Shared/Caches/user_cache.dart';
// import 'package:getx_base_code/src/Shared/Managers/user_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
// import '../../../Super/Controllers/Resources/get/get_controller_interface.dart';
// import '../../../Statics/Base/presentation/pages/base_page.dart';
// import '../../data/models/user.dart';
// import '../../domain/use_cases/set_user_info_use_case.dart';

// class SetUserInfoController extends GetControllerInterface<User> {
//   final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
//   LogOutController logOutController = Get.put(LogOutController());

//   void setUserInfo({
//     required SetUserInfoParams setUserInfoParams,
//     bool isEdit = false,
//   }) async {
//     final SetUserInfoUseCase useCase = SetUserInfoUseCase();
//     state = await useCase(params: setUserInfoParams)!;
//     if (state is DataSuccess) {
//       UserController.get.updateUser(state.data!);

//       Get.offAll(const BasePage());
//       if (isEdit) {
//         logOutController.logOut(showSnackBar: true);
//       } else {
//         UserCache().loginUser();
//       }
//     } else if (state is DataFailed) {
//       AppSnacks().showSnack(title: state.error?.title);
//     }
//   }

// // bool _isButtonDisabled = true;
// //
// // bool get isButtonDisabled => _isButtonDisabled;

// // void _checkButtonState() {
// //   if (phoneController.text.isNotEmpty && passwordController.text.isNotEmpty) {
// //     _isButtonDisabled = false;
// //   } else {
// //     _isButtonDisabled = true;
// //   }
// //   update();
// // }
// }
