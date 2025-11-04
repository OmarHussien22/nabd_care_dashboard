
import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/fetch_university_education_types_api_service.dart';
import '../../data/models/educational_information.dart';
import '../entities/educational_info_model.dart';

//<editor-fold desc="Repository">

class FetchUniversityEducationTypesRepository
    extends RepoInterface<List<EducationInformation>> {
  FetchUniversityEducationTypesRepository._();

  static final FetchUniversityEducationTypesRepository instance =
      FetchUniversityEducationTypesRepository._();

  @override
  ServicesInterface get serviceInstance =>
      FetchUniversityEducationTypesApiService();

  @override
  List<EducationInformation> Function(dynamic data) get onParse => (data) {
        List<EducationInformation> result = [];
        for (var item in data) {
          result.add(EducationalInfoModel.fromJson(item));
        }
        return result;
      };
}
//</editor-fold>
