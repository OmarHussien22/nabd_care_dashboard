import 'package:care_desk/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/enum/crud_opertion_enum.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_caller.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/methods/close_data_base_method.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/methods/get_data_base_method.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/methods/insert_data_base_method.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/methods/update_data_base_method.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:care_desk/src/Core/network_structure/networking/src/utils/network_utils.dart' show NetworkUtils;
import 'package:care_desk/src/Core/params/local_params.dart';

abstract class DataBaseServiceInterface<T>
    with TablesNames
    implements DataBaseServiceCaller {
  final _utils = NetworkUtils.instance;
  Future<LocalResponse> call(
    ActionType action, {
    required String table,
    String? where,
    List<dynamic>? whereArgs,
    // GeneralParams? whereArgs,
    LocalParams? params,
    bool showLoading = false,
    bool isGetSingleResponse = false,
  }) async {
    try {
      // NetworkLogger.instance.logSentBody(params!.toJson());
      _utils.showDialog(showLoading);
      switch (action) {
        case ActionType.insert:
          return await InsertDataBaseMethod.instance
              .insert(table: table, data: params!);
        case ActionType.fetch:
          return await GetDataBaseMethod.instance.fetch(
            tableName: table,
            where: where,
            whereArgs: params,
            showLoading: showLoading,
            singleResult: isGetSingleResponse,
          );
        case ActionType.update:
          return await UpdateDataBaseMethod.instance.update(
            table: table,
            data: params,
            where: where,
            showLoading: showLoading,
          );

        // case ActionType.delete:
        //   if (table == null || where == null || whereArgs == null) {
        //     throw Exception(
        //         "Table name, where, and whereArgs are required for DELETE");
        //   }
        //   return await DeleteDataBaseMethod.instance.delete(
        //       table: table,
        //       where: where,
        //       whereArgs: whereArgs,
        //       showLoading: showLoading);

        case ActionType.close:
          return await CloseDatabaseMethod.instance.close();

        default:
          throw Exception("Invalid Action Type");
      }
    } catch (e) {
      throw Exception("Database Operation Error: $e");
    } finally {
      _utils.closeDialog(showLoading);
    }
  }
}
