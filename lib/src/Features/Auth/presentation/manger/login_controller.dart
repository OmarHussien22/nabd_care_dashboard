import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Core/routers/go_router/app_go_router.dart';
import 'package:care_desk/src/Features/Auth/presentation/manger/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/App/app_flow.dart';
import 'package:care_desk/src/Shared/Caches/user_cache.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';

import '../../../../Core/Constants/Enums/app_source.dart';
import '../../../../Core/Constants/Strings/app_strings.dart';
import '../../../../Core/Utils/Validation/app_validator.dart';
import '../../../../Core/Utils/general_utils.dart';
import '../../../../Shared/Managers/user_controller.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
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
    formValidator(
      globalKey: globalKey,
      onSuccessValidate: () async {
        if (IntalizeAppSource.currentSource == AppSource.dev) {
          ClientSnacks.loginSuccess();
          // We use 'go' instead of 'push' to replace the stack and remove the login page
            await AuthController.instance.setAuthenticatedUser(UserModel.devUser);
            UserController.get.updateUser(UserModel.devUser);
          NavigationService.instance.go('/dashboard');
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
          if (state.data != null) {
            await AuthController.instance.setAuthenticatedUser(state.data!);
            UserController.get.updateUser(state.data!);

            ClientSnacks.loginSuccess();
            NavigationService.instance.go('/dashboard');
          }
        } else if (state is DataFailed) {
          printDM("error is=> ${state.error?.title}");
          ClientSnacks.requestError(error: state.error?.title);
        }
      },
    );
    // }
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
