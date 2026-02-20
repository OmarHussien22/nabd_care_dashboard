import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Utils/Validation/app_validator.dart';
import 'package:care_desk/src/Features/Auth/presentation/pages/imports_auth.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';

import '../../../../Core/Utils/general_utils.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../core/params/send_verification_code_params.dart';
import '../../domain/use_cases/send_verification_code_use_case.dart';

class SendVerificationCodeController extends GetControllerInterface<UserModel> {
  late TextEditingController phoneController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool _isButtonDisabled = true;
  bool get isButtonDisabled => _isButtonDisabled;

  void _checkButtonState() {
    if (phoneController.text.isNotEmpty) {
      _isButtonDisabled = false;
    } else {
      _isButtonDisabled = true;
    }
    update();
  }

  // final AppStatusController appStatusController =
  //     Get.find<AppStatusController>();

  sendVerificationCode(
      {String? phone, Function? onSuccess, bool isRegister = true}) {
    formValidator(
      globalKey: globalKey,
      onSuccessValidate: () async {
        final SendVerificationCodeUseCase useCase =
            SendVerificationCodeUseCase();
        printDM('sendVerificationCode start');
        state = await useCase(
          params: SendVerificationCodeParams(
            phone: phoneController.text,
            deviceId: "", //await DeviceInfoService.instance.getDeviceId(),
          ),
        )!;
        if (state is DataSuccess) {
          printDM('sendVerificationCode success');
          printDM("Omar pressed");
          // if (appStatusController.state.data!.whatsAppOtp == false) {
          //   Get.offAll(
          //     () => ResetPasswordPage(
          //       phone: phoneController.text,
          //     ),
          //   );
          // } else {
          Get.to(
            () => VerificationPage(
              phone: phoneController.text,
              register: false,
              onSuccess: () {
                printDM("Omar go to reset password");
                Get.offAll(
                  () => ResetPasswordPage(
                    phone: phoneController.text,
                  ),
                );
              },
            ),
          );
          // }
          // if (onSuccess != null) {
          //   onSuccess();

          // printDM("Omar null");
          // printDM('VerificationHandlerForgetPassword => phoneVerify success');
          // if (isRegister) {
          //   Get.offAll(() => ResetPasswordPage(phone: phone));
          // } else {
          //   Get.offAll(() => const LoginPage());
          // }

          // VerificationHandlerForgetPassword.instance.phoneVerify(
          //     phone: phoneController.text,
          //     fromRegister: false,
          //     onSuccess: () {
          //       Get.offAll(
          //         () => ResetPasswordPage(
          //           phone: phone,
          //         ),
          //       );
          //     });
          // }
          // PhoneVerifyService.verifyPhone(
          //   phone: phone,
          //   onSuccess: () {
          //     Get.offAll(
          //       () => ResetPasswordPage(
          //         phone: phone,
          //       ),
          //     );
          //   },
          // );
        } else {
          ClientSnacks.requestError(error: state.error?.title);
        }
        emit(state);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    phoneController.addListener(_checkButtonState);
  }

  @override
  void onClose() {
    // phoneController.dispose();
    super.onClose();
  }

// void _onPhoneExit() {}
}
