import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Auth/core/params/cahnge_online_status_params.dart';
import 'package:care_desk/src/Features/Auth/domain/use_cases/change_online_status_use_case.dart';
import 'package:care_desk/src/Shared/Caches/user_cache.dart';

import '../../../../Core/Utils/general_utils.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';

const int online = 1;
const int offline = 2;

class ChangeOnlineStatusController extends GetControllerInterface<void> {
  void changeOnlineStatus({required int status}) async {
    printDM("Omar change online status $status");
    final token = UserCache().data?.apiToken;
    if (token == null || token == "" || token.isEmpty) {
      printDM("Omar user token is null");
    } else {
      final ChangeOnlineStatusUseCase useCase = ChangeOnlineStatusUseCase();
      printDM("Omar user token is not null $token");
      state = await useCase(params: ChangeOnlineStatusParams(online: status))!;
      if (state is DataSuccess) {
        printDM('done');
      } else {
        printDM("change online status is${state.message ?? "failed"} ");
      }
      update();
    }
  }


  @override
  void onClose() {
    super.onClose();
    changeOnlineStatus(status: offline);
  }
}
