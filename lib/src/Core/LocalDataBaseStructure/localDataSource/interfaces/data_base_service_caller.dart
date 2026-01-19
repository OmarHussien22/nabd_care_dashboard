import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:care_desk/src/Core/params/local_params.dart';

abstract class DataBaseServiceCaller {
  Future<LocalResponse> applyDataBaseService({LocalParams? params});
}
