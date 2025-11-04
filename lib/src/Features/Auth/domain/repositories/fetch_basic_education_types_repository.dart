import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/fetch_basic_education_types_api_service.dart';
import '../../data/models/educational_information.dart';
import '../entities/educational_info_model.dart';

//<editor-fold desc="Repository">

class FetchBasicEducationTypesRepository
    extends RepoInterface<List<EducationInformation>> {
  FetchBasicEducationTypesRepository._();

  factory FetchBasicEducationTypesRepository() => _instance;
  static final FetchBasicEducationTypesRepository _instance =
      FetchBasicEducationTypesRepository._();

  @override
  ServicesInterface get serviceInstance => FetchBasicEducationTypesApiService();

  @override
  List<EducationInformation> Function(dynamic data) get onParse => (data) {
        return List<EducationInformation>.from(
            data.map((x) => EducationalInfoModel.fromJson(x)));
      };
}
//</editor-fold>
