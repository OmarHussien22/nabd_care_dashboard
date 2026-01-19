import 'package:care_desk/src/Features/Auth/data/data_sources/send_request_device_api_service.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';

class SendRequestDeviceRepository extends RepoInterface<void> {
  SendRequestDeviceRepository._();

  static final instance = SendRequestDeviceRepository._();

  @override
  ServicesInterface get serviceInstance => SendRequestDeviceApiService.instance;
  @override
  void Function(dynamic data) get onParse => (data) {
        return;
      };
  @override
  ResponseType get responseType => ResponseType.withoutData;
}
