import 'package:getx_base_code/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Core/params/local_params.dart';
import 'package:sqflite/sqflite.dart';

class InsertDataBaseMethod {
  static final instance = InsertDataBaseMethod._();
  InsertDataBaseMethod._();
  Future<LocalResponse> insert({
    required String table,
    required LocalParams data,
  }) async {
    try {
      final db = await DatabaseHelper.instance.database;
      int result = 0;
      if (data.toJson() == null) {
        throw Exception("Table name and data are required for INSERT");
      } else {
        result = await db.insert(
          table,
          data.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        return LocalResponse(
          data: result,
          statusCode: result == 1 ? 200 : 400,
          statusMessage:
              result == 1 ? 'تمت العملية بنجاح' : 'حدث خطأ أثناء الإضافة',
        );
      }
    } catch (e) {
      printDM('InsertDataBaseMethod error: $e');
      throw Exception(e);
      //return
    }
  }
}
