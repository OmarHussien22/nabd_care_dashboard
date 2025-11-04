import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/fetch_privacy_api_service.dart';

class FetchPrivacyRepository extends RepoInterface<String> {
  FetchPrivacyRepository._();
  static final FetchPrivacyRepository instance = FetchPrivacyRepository._();
  @override
  // TODO: implement onParse

  String Function(dynamic data) get onParse => (data) {
        return data;
      };

  @override
  // TODO: implement serviceInstance
  ServicesInterface get serviceInstance => FetchPrivacyApiService.instance;
}
