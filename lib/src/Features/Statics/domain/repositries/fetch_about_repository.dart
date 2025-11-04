import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/fetch_about_api_service.dart';
import '../../data/models/contact_info_model.dart';
import '../entities/contact_info.dart';

class FetchAboutRepository extends RepoInterface<ContactInfo> {
  FetchAboutRepository._();
  static final FetchAboutRepository instance = FetchAboutRepository._();
  @override
  ContactInfo Function(dynamic data) get onParse => (data) {
        return ContactInfoModel.fromJson(data);
      };

  @override
  // TODO: implement serviceInstance
  ServicesInterface get serviceInstance => FetchAboutAppApiService.instance;
}
