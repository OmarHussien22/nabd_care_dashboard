import '../../../../Core/App/app_flow.dart';
import '../../../../Core/Constants/Enums/app_source.dart';
import '../../../../Core/Constants/Strings/app_strings.dart';
import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../domain/use_cases/fetch_privacy_use_case.dart';

class FetchPrivacyController extends GetControllerInterface<String> {
  fetchPrivacy() async {
    emit(const DataLoading());
    if (AppFlow.currentSource == AppSource.dev) {
      state = DataSuccess(kDummyData);
      return;
    }
    final FetchPrivacyUseCase useCase = FetchPrivacyUseCase();
    state = await useCase()!;
    emit(state);
  }

  @override
  void onInit() {
    fetchPrivacy();
    super.onInit();
  }
}
