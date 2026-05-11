import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import '../../data/data_sources/global_search_api_service.dart';
import '../../data/models/search_result_model.dart';
import '../entities/search_result_entity.dart';

class GlobalSearchRepository extends RepoInterface<SearchResultEntity> {
  GlobalSearchRepository._();
  static final instance = GlobalSearchRepository._();

  @override
  ServicesInterface get serviceInstance => GlobalSearchApiService.instance;

  @override
  SearchResultEntity Function(dynamic data) get onParse => (data) {
        return SearchResultModel.fromJson(data);
      };
}
