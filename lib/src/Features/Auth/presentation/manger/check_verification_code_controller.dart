import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../core/params/check_verification_code_params.dart';
import '../../domain/use_cases/check_verification_code_use_case.dart';
import 'send_verification_code_controller.dart';

class CheckVerificationCodeController
    extends GetControllerInterface<UserModel> {
  TextEditingController? codeController;
  StreamController<ErrorAnimationType>? errorController;

  Future<DataState<UserModel>> checkVerificationCode(
      {required String phone, Function? onSuccess}) async {
    final CheckVerificationCodeUseCase useCase = CheckVerificationCodeUseCase();
    state = await useCase(
      params: CheckVerificationCodeParams(
        phone: phone,
        verificationCode: codeController!.text,
        deviceId: "", //await DeviceInfoService.instance.getDeviceId(),
      ),
    )!;
    emit(state);
    if (state is DataSuccess) {
      if (onSuccess != null) {
        onSuccess();
      }
    } else {
      ClientSnacks.requestError(error: state.error?.title);
    }
    return state;
  }

  late Timer _timer;
  int countDownTimer = 59;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    countDownTimer = 59;
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        printDM("timer started : countDownTimer = $countDownTimer");
        if (countDownTimer == 0) {
          timer.cancel();
          update();
        } else {
          countDownTimer--;
          update();
        }
      },
    );
  }

  void resendCode({required String phone}) {
    if (countDownTimer > 0) {
      // update();
    } else {
      // TODO : Resend Code
      printDM("phone$phone");
      Get.put(SendVerificationCodeController()).sendVerificationCode(
        phone: phone,
        onSuccess: () {
          startTimer();
        },
      );
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    codeController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
    startTimer();
  }

  @override
  void onClose() {
    // errorController!.close();
    // textEditingController!.dispose();
    _timer.cancel();
    super.dispose();
  }
}
