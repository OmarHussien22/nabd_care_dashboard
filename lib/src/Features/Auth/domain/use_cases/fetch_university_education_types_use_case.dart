//<editor-fold desc="UseCase">
import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../../data/models/educational_information.dart';
import '../repositories/fetch_university_education_types_repository.dart';

class FetchUniversityEducationTypesUseCase
    extends UseCase<List<EducationInformation>, void> {
  // FetchUniversityEducationTypesUseCase._();

  @override
  Future<DataState<List<EducationInformation>>>? call({void params}) {
    return FetchUniversityEducationTypesRepository.instance.call();
  }
}
//</editor-fold>
