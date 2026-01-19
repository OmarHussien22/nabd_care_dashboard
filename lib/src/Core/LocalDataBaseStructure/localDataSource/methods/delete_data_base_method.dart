import 'package:care_desk/Src/core/NetworkStructure/Networking/src/Utils/network_utils.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';

class DeleteDataBaseMethod {
  static final instance = DeleteDataBaseMethod._();
  DeleteDataBaseMethod._();
  final _utils = NetworkUtils.instance;
  Future<LocalResponse<dynamic>>delete({
    required String table,
    String? where,
    List<dynamic>? whereArgs,
    bool showLoading = false,
  }) async {
    try {
      _utils.showDialog(showLoading);
      final db = await DatabaseHelper.instance.database;
      final result = await db.delete(table, where: where, whereArgs: whereArgs);
      printDM("Deleted $result rows");
      return LocalResponse(data: result, statusMessage: "Deleted $result rows",);
    } catch (e) {
      printDM("Error: $e");
      throw Exception(e);
    } finally {
      _utils.closeDialog(showLoading);
    }
  }
}
