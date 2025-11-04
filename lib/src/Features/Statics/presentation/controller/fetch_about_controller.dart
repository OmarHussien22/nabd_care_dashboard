import '../../../../Core/App/app_flow.dart';
import '../../../../Core/Constants/Enums/app_source.dart';
import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../data/models/contact_info_model.dart';
import '../../domain/entities/contact_info.dart';
import '../../domain/use_cases/fetch_about_use_case.dart';

class FetchAboutController extends GetControllerInterface<ContactInfo> {
  Future<void> fetchAbout() async {
    emit(const DataLoading());
    if (AppFlow.currentSource == AppSource.dev) {
      state = DataSuccess(ContactInfoModel.example);
      return;
    }
    final FetchAboutUseCase useCase = FetchAboutUseCase();
    state = await useCase()!;
    emit(state);
  }

  @override
  void onInit() {
    fetchAbout();
    super.onInit();
  }
}
