import 'package:care_desk/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Utils/SnackUtils/snack_utils.dart';
import 'package:care_desk/src/Features/Base/presentation/pages/base_page.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Dialogs/app_dialogs.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:get/get.dart';
import '../../domain/use_cases/check_phone_verified_use_case.dart';

class CheckPhoneVerifiedController extends GetControllerInterface<UserModel> {
  checkPhoneVerified() async {
    emit(const DataLoading());
    AppDialogs.showLoadingDialog();
    final CheckPhoneVerifiedUseCase useCase = CheckPhoneVerifiedUseCase();
    state = await useCase()!;
    Get.back();
    emit(state);
    if (state is DataSuccess) {
      if (state.data?.isPhoneVerify ?? false) {
        Get.offAll(() => const BasePage());
      } else {
        AppSnacks().showSnack(
            title: "phone_not_verified".toTr(), state: UtilState.warning);
      }
    } else {
      ClientSnacks.requestError(error: state.error?.title);
    }
  }
}
