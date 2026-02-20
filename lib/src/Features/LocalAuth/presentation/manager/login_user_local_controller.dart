import 'package:care_desk/src/Features/MainLayout/presentation/pages/main_layout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Features/LocalAuth/data/models/local_user_model.dart';
import 'package:care_desk/src/Features/LocalAuth/domain/use_cases/login_user_local_use_case.dart';
import 'package:care_desk/src/Features/LocalAuth/login_user_params.dart';
import 'package:care_desk/src/Shared/Caches/user_cache_local.dart';
import 'package:care_desk/src/Shared/Managers/user_local_controller.dart';

import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import '../../../../Core/Utils/Validation/app_validator.dart';
import '../../../../Core/Utils/general_utils.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';

class LoginUserLocalController extends GetControllerInterface<LocalUserModel> {
  late ScrollController scrollController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  void login({String? phone, String? password}) {
    if (phone != null && password != null) {
      phoneController!.text = phone;
      passwordController!.text = password;
    }
    formValidator(
      globalKey: globalKey,
      onSuccessValidate: () async {
        final LoginUserLocalUseCase useCase = LoginUserLocalUseCase();
        state = await useCase(
          params: LoginUserParams(
            emailOrPhone: phoneController!.text,
            password: passwordController!.text,
          ),
        );
        emit(state);
        if (state is DataSuccess) {
          if (state.data != null) {
            UserLocalController.get.updateUser(state.data!);
            UserCacheLocal().saveUser(state.data!);
            UserCacheLocal().loginUser();
            printDM("login success ${state.data}");
            // ClientSnacks.loginSuccess();
            Get.offAll(const MainLayoutPage(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 300));
          }
        } else if (state is DataFailed) {
          printDM("error is=> ${state.error?.title}");
          ClientSnacks.requestError(error: state.error?.title);
        }
      },
    );
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
