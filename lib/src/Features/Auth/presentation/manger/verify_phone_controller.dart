import 'dart:ui';
import 'package:care_desk/src/Shared/Models/user_model.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Shared/Managers/user_controller.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../domain/use_cases/verify_phone_use_case.dart';

class VerifyPhoneController extends GetControllerInterface<UserModel> {
  Future<void> verifyPhone({required VoidCallback onVerified}) async {
    final VerifyPhoneUseCase useCase = VerifyPhoneUseCase();
    state = await useCase()!;
    if (state is DataSuccess) {
      UserController.get.updateUser(state.data!);
      onVerified();
      // Get.offAll(const HomePage());
    } else if (state is DataFailed) {
      //  AppSnacks.showErrorSnack(state.message);
    }
  }
}
