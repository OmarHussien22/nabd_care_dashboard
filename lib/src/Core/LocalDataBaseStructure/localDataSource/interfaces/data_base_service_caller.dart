import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:getx_base_code/src/Core/params/local_params.dart';

abstract class DataBaseServiceCaller {
  Future<LocalResponse> applyDataBaseService({LocalParams? params});
}
