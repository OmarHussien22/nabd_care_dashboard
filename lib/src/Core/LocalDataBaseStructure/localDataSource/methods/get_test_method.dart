import 'package:care_desk/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Core/network_structure/networking/src/utils/network_utils.dart' show NetworkUtils;
import 'package:care_desk/src/Core/params/local_params.dart';

class GetDataTestBaseMethod<T> {
  final _utils = NetworkUtils.instance;

  Future<List<T>> fetch({
    required String tableName,
    LocalParams? whereArgs,
    String? where,
    // required T Function(Map<String, dynamic>) fromJson,
    bool showLoading = false,
    List<String>? whereColumns,
    List<dynamic>? whereValues,
    bool singleResult = false,
  }) async {
    try {
      _utils.showDialog(showLoading);
      final db = await DatabaseHelper.instance.database;

      // if (whereArgs != null) {
      //   final whereMap = whereArgs.toJson();
      //   whereColumns = whereMap.keys.map((key) => "$key = ?").toList();
      //   whereValues = whereMap.values.toList();
      // }

      final result = await db.query(
        tableName,
        // where: whereColumns?.join(" AND "),
        // whereArgs: whereValues,
      );

      _utils.closeDialog(showLoading);
      if (result.isNotEmpty) {
        printDM("Omar Hussien $result");
        return result.map((e) => e as T).toList();
      } else {
        printDM("Omar No data");
        throw Exception("No data found");
      }
    } catch (e) {
      _utils.closeDialog(showLoading);
      printDM("Omar exception ${e.toString()}");
      return [];
    }
  }
}
