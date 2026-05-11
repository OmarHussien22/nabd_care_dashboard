import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';
import 'package:dio/dio.dart';

class GlobalSearchApiService extends ServicesInterface {
  GlobalSearchApiService._();
  static final instance = GlobalSearchApiService._();

  @override
  Future<Response> applyService({Params? params}) async {
    return await call(
      urlGlobalSearch,
      type: CrudType.get,
      params: params,
      auth: true,
    );
  }
}
