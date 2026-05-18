import 'package:dio/src/response.dart';

import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';

class FetchStaticsApiServiec extends ServicesInterface {
  FetchStaticsApiServiec._();

  static final instance = FetchStaticsApiServiec._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      urlFetchStatics,
      type: CrudType.get,
      params: params,
      auth: true,
    );
  }
}
