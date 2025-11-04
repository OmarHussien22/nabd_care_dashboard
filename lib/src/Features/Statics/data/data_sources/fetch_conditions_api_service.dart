
import 'package:dio/src/response.dart';
import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class FetchConditionsApiService extends ServicesInterface{
  FetchConditionsApiService._();
  static final FetchConditionsApiService instance = FetchConditionsApiService._();
  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
        uRLFetchConditions,
        type: CrudType.get,
    );
  }
}