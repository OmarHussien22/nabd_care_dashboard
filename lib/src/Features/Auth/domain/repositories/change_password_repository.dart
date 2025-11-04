import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/change_password_api_service.dart';

class ChangePasswordRepository extends RepoInterface<bool> {
  ChangePasswordRepository._();

  static final instance = ChangePasswordRepository._();

  @override
  ServicesInterface get serviceInstance => ChangePasswordApiService.instance;
  @override
  bool Function(dynamic data) get onParse => (data) {
        return true;
      };
  @override
  ResponseType get responseType => ResponseType.withoutData;
}
