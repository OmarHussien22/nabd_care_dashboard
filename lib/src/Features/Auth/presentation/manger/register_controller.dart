import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/App/app_flow.dart';
import 'package:care_desk/src/Features/Auth/presentation/pages/imports_auth.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';

import '../../../../Core/Constants/Enums/app_source.dart';
import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Core/Utils/Validation/app_validator.dart';
import '../../../../Core/Utils/general_utils.dart';
import '../../../../Shared/Managers/user_controller.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../core/params/register_params.dart';
import '../../domain/use_cases/register_use_case.dart';

class RegisterController extends GetControllerInterface<UserModel> {
  late TextEditingController phoneController;
  late TextEditingController parentPhoneController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController email;
  late TextEditingController address;
  late TextEditingController parentNameController;
  late TextEditingController confirmPasswordController;

  String countryCodeStudent = '+20';
  String countryCodeParent = '+20';

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  // final _verifyPhoneController = Get.put(VerifyPhoneController());
  // final _checkVerificationCodeController =
  //     Get.put(CheckVerificationCodeController());

  // Future<void> _checkIfUserExist({required Function(User?) onUserFound}) async {
  //   final user = await _checkVerificationCodeController.checkVerificationCode(
  //     phoneController.text,
  //   );
  //   onUserFound(user.data);
  // }

  onCountryCodeStudentChange(String value) {
    countryCodeStudent = value;
    update();
  }

  onCountryCodeParentChange(String value) {
    countryCodeParent = value;
    update();
  }

  checkEgyptPhone() {
    if (countryCodeStudent == "+20") {
      bool firstZero = phoneController.text.startsWith("0");
      printDM('phone has zero in first $firstZero');
      if (firstZero) {
        phoneController.text = phoneController.text.substring(1);
        update();
      }
    }
    if (countryCodeParent == "+20") {
      bool firstZero = parentPhoneController.text.startsWith("0");
      printDM('phone has zero in first $firstZero');
      if (firstZero) {
        parentPhoneController.text = parentPhoneController.text.substring(1);
        update();
      }
    }
  }

  void register() {
    // checkEgyptPhone();
    formValidator(
      globalKey: globalKey,
      onSuccessValidate: () async {
        if (AppFlow.currentSource == AppSource.dev) {
          // ClientSnacks.registerSuccess();
          // Get.offAll(const CompleteDataPage());
          return;
        }
        String? deviceToken;
        try {
          // deviceToken = await FCMService.deviceToken;
        } catch (e) {
          printDM(e.toString());
        }
        final RegisterUseCase useCase = RegisterUseCase();
        state = await useCase(
          params: RegisterParams(
            phone: phoneController.text,
            countryCode: countryCodeStudent,
            email: email.text,
            address: address.text,
            // phone: countryCodeStudent + phoneController.text,
            password: passwordController.text,
            name: nameController.text,
            parentName: parentNameController.text,
            // parentPhone: countryCodeParent + parentPhoneController.text,
            parentPhone: parentPhoneController.text,
            deviceToken: deviceToken,
            deviceId: "", //await DeviceInfoService.instance.getDeviceId(),
            deviceType: "", //await DeviceInfoService.instance.type,
            // isRealDevice: await SafeDevice.isRealDevice,
            // version: AppStrings.appVersion,
          ),
        )!;
        if (state is DataSuccess) {
          if (state.data != null) {
            UserController.get.updateUser(state.data);
          }
          // CheckSendDeviceRequestHandler.checkSendDeviceRequest(
          //     phone: phoneController.text,
          //     deviceId: await DeviceInfoService.instance.getDeviceId(),
          //     deviceType: await DeviceInfoService.instance.type,
          //     onSuccess: () {
          //       ClientSnacks.registerSuccess();
          //       UserController.get.updateUser(state.data!);
          //       UserCache().loginUser();
          //       checkNeedOtp();
          //     });
        } else if (state is DataFailed) {
          ClientSnacks.requestError(error: state.error?.title);
        }
      },
    );
  }

  // AppStatusController appStatusController = Get.put(AppStatusController());

  void checkNeedOtp() {
    printDM("Omar 1");
    // if (appStatusController.state.data!.whatsAppOtp == true) {
    printDM("Omar 2");

    if (state.data!.isPhoneVerify ?? false) {
      printDM("Omar 3");
      Future.delayed(
        const Duration(milliseconds: 350),
        () {
          Get.offAll(
            VerificationPage(
              phone: phoneController.text,
              onSuccess: () {
                // Get.offAll(() => const CompleteDataPage());
              },
            ),
            transition: Transition.leftToRightWithFade,
          );
        },
      );
    } else {
      printDM("Omar 4");

      Future.delayed(
        const Duration(milliseconds: 350),
        () {
          // Get.offAll(const CompleteDataPage());
        },
      );
    }
    // } else {
    //   printDM("Omar 5");
    //   Future.delayed(const Duration(milliseconds: 350), () {
    //     Get.offAll(const CompleteDataPage());
    //   });
    // }
  }

  bool _isButtonDisabled = false;

  bool get isButtonDisabled => _isButtonDisabled;

  void _changeButtonState() {
    if (phoneController.text.isNotEmpty &&
        // parentPhoneController.text.isNotEmpty &&
        // parentPhoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      _isButtonDisabled = false;
    } else {
      _isButtonDisabled = true;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    address = TextEditingController();
    parentPhoneController = TextEditingController();
    passwordController = TextEditingController();
    parentNameController = TextEditingController();
    nameController = TextEditingController();
    email = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController.addListener(_changeButtonState);
    passwordController.addListener(_changeButtonState);
    nameController.addListener(_changeButtonState);
    confirmPasswordController.addListener(_changeButtonState);
  }

}
