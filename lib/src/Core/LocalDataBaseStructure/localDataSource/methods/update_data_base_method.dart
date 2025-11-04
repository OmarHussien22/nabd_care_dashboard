import 'package:getx_base_code/Src/core/NetworkStructure/Networking/src/Utils/network_utils.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/mixin_has_id.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:getx_base_code/src/Core/params/local_params.dart';

class UpdateDataBaseMethod {
  static final instance = UpdateDataBaseMethod._();
  UpdateDataBaseMethod._();

  final _utils = NetworkUtils.instance;

  Future<LocalResponse> update({
    required String table,
    LocalParams? data,
    String? where,
    bool showLoading = false,
  }) async {
    if (table.isEmpty || data == {} || where!.isEmpty) {
      return LocalResponse(
        data: null,
        statusCode: 400,
        statusMessage: "Invalid input: Missing required parameters.",
      );
    }

    try {
      _utils.showDialog(showLoading);
      final db = await DatabaseHelper.instance.database;
      final int id = (data as HasId).id;

      ///استخدام transaction
      // لو التحديث فشل في منتصف العملية، بيرجع كل حاجة لحالتها الأصلية
      if (data is HasId) {
        final result = await db.transaction((txn) async {
          return await txn.update(
            table,
            data!.toJson(),
            where: where,
            whereArgs: [id],
          );
        });
        return LocalResponse(
          data: result,
          statusCode: 200,
          statusMessage: "Updated $result rows successfully.",
        );
      } else {
        return LocalResponse(
          data: null,
          statusCode: 400,
          statusMessage: "Invalid input: Missing required parameters.",
        );
      }
    } catch (e) {
      return LocalResponse(
        data: null,
        statusCode: 500,
        statusMessage: "Database Update Error: $e",
      );
    } finally {
      _utils.closeDialog(showLoading);
    }
  }
}
