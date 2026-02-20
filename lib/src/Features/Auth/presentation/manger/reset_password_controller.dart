import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';

import '../../../../Core/Utils/SnackUtils/snack_utils.dart';
import '../../../../Core/Utils/Validation/app_validator.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../core/params/reset_password_params.dart';
import '../../domain/use_cases/reset_password_use_case.dart';
import '../pages/imports_auth.dart';

class ResetPasswordController extends GetControllerInterface<UserModel> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final String phone;

  ResetPasswordController({required this.phone});

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool _isDisabled = true;

  bool get isDisabled => _isDisabled;

  void checkButtonState() {
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      _isDisabled = true;
    } else {
      _isDisabled = false;
    }
    update();
  }

  // final AppStatusController appStatusController =
  //     Get.put(AppStatusController());
  void resetPassword() {
    formValidator(
      globalKey: globalKey,
      onSuccessValidate: () async {
        // if (AppFlow.currentSource == AppSource.dev) {
        //   AppSnacks().showSnack(title: "reset_password_done".toTr());
        //   Get.offAll(const LoginPage());
        //   return;
        // }
        final ResetPasswordUseCase useCase = ResetPasswordUseCase();
        state = await useCase(
            params: ResetPasswordParams(
          password: passwordController.text,
          phone: phone,
        ))!;
        if (state is DataSuccess) {
          Get.offAll(const LoginPage());
          // if (appStatusController.state.data!.whatsAppOtp == true) {
          //   Future.delayed(const Duration(milliseconds: 350), () {
          //     Get.offAll(
          //       VerificationPage(
          //         phone: phone,
          //         onSuccess: () {
          //           Get.offAll(() => const LoginPage());
          //         },
          //       ),
          //       transition: Transition.leftToRightWithFade,
          //     );
          //   });
          // } else {
          //   Future.delayed(const Duration(milliseconds: 350), () {
          //     Get.offAll(
          //       const LoginPage(),
          //       transition: Transition.leftToRightWithFade,
          //     );
          //   });
          // }
          AppSnacks().showSnack(title: "reset_password_done".toTr());
          // TODO Do On Success Function
        } else if (state is DataFailed) {
          AppSnacks().showSnack(title: state.error?.title ?? "");
        }
      },
      onFailedValidate: () {},
    );
  }

  @override
  void onInit() {
    super.onInit();
    confirmPasswordController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController.addListener(checkButtonState);
    passwordController.addListener(checkButtonState);
  }
}
