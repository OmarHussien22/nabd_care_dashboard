import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/fetch_conditions_api_service.dart';

class FetchConditionsRepository extends RepoInterface<String> {
  FetchConditionsRepository._();
  static final FetchConditionsRepository instance =
      FetchConditionsRepository._();
  @override
  // TODO: implement onParse
  String Function(dynamic data) get onParse => (data) {
        return data;
      };

  @override
  // TODO: implement serviceInstance
  ServicesInterface get serviceInstance => FetchConditionsApiService.instance;
}
