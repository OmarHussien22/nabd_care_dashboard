import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';
import 'package:getx_base_code/src/Core/Utils/SnackUtils/src/Constants/snack_constants.dart';
import 'package:getx_base_code/src/Core/Utils/SnackUtils/src/app_snacks.dart';

class ClientSnacks {
  ClientSnacks._();
  // static const bool _isToast = false;

  static void _showUtil({required String title, required UtilState state}) {
    AppSnacks().showSnack(
      title: title,
      state: state,
    );
  }

  static void connectionError() => _showUtil(
        state: UtilState.warning,
        title: "snack_check_ur_connection".toTr(),
      );

  static void showDefaultSnack({String message = ""}) => _showUtil(
        state: UtilState.warning,
        title: message,
      );

  static void requestError({String? error}) => _showUtil(
        state: UtilState.error,
        title: error ?? "snack_something_went_wrong".toTr(),
      );

  static void successMessage({String? message}) => _showUtil(
        state: UtilState.success,
        title: "✅$message".toTr() ?? "snack_success".toTr(),
      );

  static void errorMessage() => _showUtil(
        state: UtilState.error,
        title: " snack_error".toTr(),
      );

  static void loginSuccess() => _showUtil(
        state: UtilState.success,
        title: "snack_login_success".toTr(),
      );
  static void registerSuccess() => _showUtil(
        state: UtilState.success,
        title: "snack_register_success".toTr(),
      );

  static void logoutSuccess() => _showUtil(
        state: UtilState.success,
        title: "snack_logout_success".toTr(),
      );

  static void shortPassword() => _showUtil(
        state: UtilState.warning,
        title: "snack_short_password".toTr(),
      );

  static void notMatchedPasswords() => _showUtil(
        state: UtilState.warning,
        title: "validate_confirm_password".toTr(),
      );

  static void invalidNumber() => _showUtil(
        state: UtilState.warning,
        title: "snack_validate_number".toTr(),
      );

  static void passwordChangedsuccess() => _showUtil(
        state: UtilState.success,
        title: "success_password".toTr(),
      );

  static void phoneVerifysuccess() => _showUtil(
        state: UtilState.success,
        title: "success_phone_verify".toTr(),
      );

  static void messageSentsuccess() => _showUtil(
        state: UtilState.success,
        title: "success_message_sent".toTr(),
      );

  static void usernameChangedsuccess() => _showUtil(
        state: UtilState.success,
        title: "success_username".toTr(),
      );

  static void birthdayChangedsuccess() => _showUtil(
        state: UtilState.success,
        title: "success_birthday".toTr(),
      );

  static void personalImageChangedsuccess() => _showUtil(
        state: UtilState.success,
        title: "success_image".toTr(),
      );

  static void profileUpdatedSuccess() => _showUtil(
        state: UtilState.success,
        title: "profile_updated_successfully".toTr(),
      );
}
