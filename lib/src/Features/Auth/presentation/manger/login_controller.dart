import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/App/app_flow.dart';
import 'package:getx_base_code/src/Shared/Caches/user_cache.dart';
import 'package:getx_base_code/src/Shared/Models/user_model.dart';

import '../../../../Core/Constants/Enums/app_source.dart';
import '../../../../Core/Constants/Strings/app_strings.dart';
import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Core/Utils/Validation/app_validator.dart';
import '../../../../Core/Utils/general_utils.dart';
import '../../../../Shared/Managers/user_controller.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../../Base/presentation/pages/base_page.dart';
import '../../core/params/login_params.dart';
import '../../domain/use_cases/login_use_case.dart';

class LoginController extends GetControllerInterface<UserModel> {
  late ScrollController scrollController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  String countryCode = '+20';
  //final _verifyPhoneController = Get.put(VerifyPhoneController());
  // final ScreenRecordDetectorController screenDetectorController =
  //     Get.find<ScreenRecordDetectorController>();
  onCountryCodeChange(String value) {
    countryCode = value;
    update();
  }

  void login({String? phone, String? password}) {
    if (phone != null && password != null) {
      phoneController!.text = phone;
      passwordController!.text = password;
    }
    // if (screenDetectorController.detectorScreen == true) {
    //   ClientSnacks.requestError(error: "يجب عليك اغلاق تسجيل الشاشة");
    // } else {
    formValidator(
      globalKey: globalKey,
      onSuccessValidate: () async {
        if (AppFlow.currentSource == AppSource.dev) {
          ClientSnacks.loginSuccess();
          Get.offAll(const BasePage());
          return;
        }
        final LoginUseCase useCase = LoginUseCase();
        String? deviceToken;
        try {
          // deviceToken = await FCMService.deviceToken;
        } catch (e) {
          printDM(e.toString());
        }
        state = await useCase(
          params: LoginParams(
            phone: phoneController!.text,
            password: passwordController!.text,
            countryCode: countryCode,
            deviceToken: deviceToken,
            deviceId: "", //await DeviceInfoService.instance.getDeviceId(),
            deviceType: "", //await DeviceInfoService.instance.type,
            version: AppStrings.appVersion,
            // isRealDevice: await SafeDevice.isRealDevice,
            isVisitor: 0,
          ),
        )!;
        if (state is DataSuccess) {
          // Get.put(AppStatusController()).fetchAppStatus();
          if (state.data != null) {
            UserController.get.updateUser(state.data!);
          }
          // CheckSendDeviceRequestHandler.checkSendDeviceRequest(
          //   phone: phoneController!.text,
          //   deviceId: await DeviceInfoService.instance.getDeviceId(),
          //   deviceType: await DeviceInfoService.instance.type,
          //   onSuccess: () {
          //     ClientSnacks.loginSuccess();
          //     if (state.data != null) {
          //       UserController.get.updateUser(state.data!);
          //     }
          //     if (state.data?.isBlocked == true) {
          //       Get.to(const BlockedPage());
          //     } else {
          //       UserController.get.updateUser(state.data!);
          //       if (state.data!.type == 1) {
          //         AppStatusController.get.appType = AppType.center;
          //       } else if (state.data!.type == 2) {
          //         AppStatusController.get.appType = AppType.lecturer;
          //       }
          //       if (state.data?.isInfoComplete == 0) {
          //         printDM("omar update ");
          //         Get.offAll(const CompleteDataPage());
          //       } else {
          //         UserCache().loginUser();
          //         Get.offAll(const BasePage());
          //       }
          //     }
          //   },
          // );

          // ClientSnacks.loginSuccess();
          // Get.put(AppStatusController()).fetchAppStatus();
          // if (state.data != null) {
          //   UserController.get.updateUser(state.data!);
          // }
          // if (state.data?.isBlocked == true) {
          //   Get.to(const BlockedPage());
          // } else {
          //   UserController.get.updateUser(state.data!);
          //   if (state.data!.type == 1) {
          //     AppStatusController.get.appType = AppType.center;
          //   } else if (state.data!.type == 2) {
          //     AppStatusController.get.appType = AppType.lecturer;
          //   }
          //
          //   // VerificationHandler.instance.phoneVerify(
          //   //   phone: phoneController.text,
          //   //   // onSuccess: () {
          //   //   //   UserController.get.updateUser(state.data!);
          //   //   //   if (state.data!.type == 1) {
          //   //   //     AppStatusController.get.appType = AppType.center;
          //   //   //   } else if (state.data!.type == 2) {
          //   //   //     AppStatusController.get.appType = AppType.lecturer;
          //   //   //   }
          //   //   //   // Get.offAll(const BasePage());
          //   //   // },
          //   // );
          //   if (state.data?.isInfoComplete == 0) {
          //     printDM("omar update ");
          //     Get.offAll(const CompleteDataPage());
          //   } else {
          //     UserCache().loginUser();
          //     Get.offAll(const BasePage());
          //   }
          // }
        } else if (state is DataFailed) {
          printDM("error is=> ${state.error?.title}");
          ClientSnacks.requestError(error: state.error?.title);
        }
      },
    );
    // }
  }

  void loginAsVisitor() async {
    // if (screenDetectorController.detectorScreen == true) {
    ClientSnacks.requestError(error: "يجب عليك اغلاق تسجيل الشاشة");
    // } else {
    final LoginUseCase useCase = LoginUseCase();
    state = await useCase(
      params: LoginParams(
        phone: "01013171109",
        password: "1234567890",
        deviceToken: null,
        deviceId: "", //await DeviceInfoService.instance.getDeviceId(),
        deviceType: "", //await DeviceInfoService.instance.type,
        version: AppStrings.appVersion,
        // isRealDevice: await SafeDevice.isRealDevice,
        isVisitor: 1,
      ),
    )!;
    if (state is DataSuccess) {
      if (state.data != null) {
        UserController.get.updateUser(state.data!);
        // Get.put(AppStatusController()).fetchAppStatus();
        UserCache().loginUser();
        Get.offAll(const BasePage());
        // } else {
        //   UserController.get.updateUser(state.data!);
        //   if (state.data!.type == 1) {
        //     AppStatusController.get.appType = AppType.center;
        //   } else if (state.data!.type == 2) {
        //     AppStatusController.get.appType = AppType.lecturer;
        //   } else {
        //     printDM("Omar Hussien");
        //     // UserCache().loginUser();
        //     // Get.offAll(const BasePage());
        //   }
        // }
      } else if (state is DataFailed) {
        printDM("error is=> ${state.error?.title}");
        ClientSnacks.requestError(error: state.error?.title);
      }
    }
  }

  bool _isButtonDisabled = true;

  bool get isButtonDisabled => _isButtonDisabled;

  void _checkButtonState() {
    if (phoneController!.text.isNotEmpty &&
        passwordController!.text.isNotEmpty) {
      _isButtonDisabled = false;
    } else {
      _isButtonDisabled = true;
    }
    update();
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    phoneController!.addListener(_checkButtonState);
    passwordController!.addListener(_checkButtonState);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();

    super.onClose();
  }
}
