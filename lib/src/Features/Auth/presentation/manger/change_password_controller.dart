import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';

import '../../../../Core/Utils/SnackUtils/snack_utils.dart';
import '../../../../Core/Utils/Validation/app_validator.dart';
import '../../../../Core/Utils/general_utils.dart';
import '../../../../Shared/Caches/user_cache.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../core/params/change_password_params.dart';
import '../../domain/use_cases/change_password_use_case.dart';
import '../pages/imports_auth.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetControllerInterface<bool> {
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool _isButtonDisabled = true;

  bool get isButtonDisabled => _isButtonDisabled;

  void changePassword() {
    if (newPasswordController.text == oldPasswordController.text) {
      AppSnacks().showSnack(
        title: "validate_password_same_as_old".toTr(),
        state: UtilState.error,
      );
      return;
    }
    formValidator(
      globalKey: globalKey,
      onSuccessValidate: () async {
        final ChangePasswordUseCase useCase = ChangePasswordUseCase();
        state = await useCase(
            params: ChangePasswordParams(
          oldPassword: oldPasswordController.text,
          newPassword: newPasswordController.text,
        ))!;
        if (state.data ?? false) {
          printDM('done');
          UserCache().logout();
          NavigationService.instance.go('/login');
          ClientSnacks.passwordChangedsuccess();
        } else {
          AppSnacks().showSnack(
            title: state.error?.title ?? 'حدث خطا ما',
            state: UtilState.error,
          );
        }
      },
      onFailedValidate: () {},
    );
  }

  void _checkButtonState() {
    if (oldPasswordController.text.isNotEmpty &&
        newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      _isButtonDisabled = false;
      update();
    } else {
      _isButtonDisabled = true;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    confirmPasswordController = TextEditingController();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    oldPasswordController.addListener(() {
      _checkButtonState();
    });
    newPasswordController.addListener(() {
      _checkButtonState();
    });
    confirmPasswordController.addListener(() {
      _checkButtonState();
    });
  }

  @override
  void onClose() {
    super.onClose();
    confirmPasswordController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
  }
}
