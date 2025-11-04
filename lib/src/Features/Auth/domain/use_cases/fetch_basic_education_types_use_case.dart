//<editor-fold desc="UseCase">
import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../../data/models/educational_information.dart';
import '../repositories/fetch_basic_education_types_repository.dart';

class FetchBasicEducationTypesUseCase
    extends UseCase<List<EducationInformation>, void> {
  factory FetchBasicEducationTypesUseCase() => _instance;
  static final FetchBasicEducationTypesUseCase _instance =
      FetchBasicEducationTypesUseCase._();

  FetchBasicEducationTypesUseCase._();

  @override
  Future<DataState<List<EducationInformation>>>? call({void params}) {
    return FetchBasicEducationTypesRepository().call();
  }
}
//</editor-fold>
