import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../entities/contact_info.dart';
import '../../data/data_sources/fetch_app_info_api_service.dart';
import '../../data/models/contact_info_model.dart';

class FetchAppInfoRepository extends RepoInterface<ContactInfo> {
  FetchAppInfoRepository._();
  static final FetchAppInfoRepository instance = FetchAppInfoRepository._();
  @override
  ContactInfo Function(dynamic data) get onParse => (data) {
        return ContactInfoModel.fromJson(data);
      };

  @override
  // TODO: implement serviceInstance
  ServicesInterface get serviceInstance => FetchAppInfoApiService.instance;
}
