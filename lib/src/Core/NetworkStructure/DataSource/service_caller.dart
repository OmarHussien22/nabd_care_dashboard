import 'package:dio/dio.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Params/params.dart';

abstract class ServiceCaller {
  Future<Response> applyService({Params? params});
}
