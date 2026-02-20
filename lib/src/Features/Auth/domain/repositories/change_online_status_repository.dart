import 'package:care_desk/src/Features/Auth/data/data_sources/change_online_status_api_service.dart';

import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';

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
