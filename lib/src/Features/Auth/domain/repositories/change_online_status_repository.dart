import 'package:getx_base_code/src/Features/Auth/data/data_sources/change_online_status_api_service.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';

class ChangeOnlineStatusRepository extends RepoInterface<void> {
  ChangeOnlineStatusRepository._();

  static final instance = ChangeOnlineStatusRepository._();

  @override
  ServicesInterface get serviceInstance =>
      ChangeOnlineStatusApiService.instance;
  @override
  void Function(dynamic data) get onParse => (data) {
        return;
      };
  @override
  ResponseType get responseType => ResponseType.withoutData;
}
