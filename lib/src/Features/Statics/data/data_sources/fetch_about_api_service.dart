import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class FetchAboutAppApiService extends ServicesInterface {
  FetchAboutAppApiService._();
  static final FetchAboutAppApiService instance = FetchAboutAppApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      uRLFetchSettings,
      type: CrudType.get,
      showLoadingDialog: false,
    );
  }
}
