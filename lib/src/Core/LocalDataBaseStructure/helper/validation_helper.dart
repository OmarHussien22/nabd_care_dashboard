import 'package:care_desk/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';

class ValidationHelper {
  static final ValidationHelper instance = ValidationHelper._();
  ValidationHelper._();

  Future<bool> isValueExists({
    required String table,
    required String column,
    required dynamic value,
  }) async {
    final db = await DatabaseHelper.instance.database;
    final result =
        await db.query(table, where: "$column = ?", whereArgs: [value]);
    return result.isNotEmpty;
  }

  Future<T?> insertWithValidation<T>({
    required String table,
    required Map<String, dynamic> data,
    required List<String> uniqueColumns,
    required T Function(dynamic) fromJson,
  }) async {
    final db = await DatabaseHelper.instance.database;

    // 🔍 **التحقق من القيم الفريدة**
    for (var column in uniqueColumns) {
      bool exists = await isValueExists(
          table: table, column: column, value: data[column]);
      if (exists) {
        throw Exception("$column مستخدم بالفعل! الرجاء اختيار قيمة أخرى.");
      }
    }

    // ✅ **إدخال البيانات بعد التحقق**
    final id = await db.insert(table, data);
    if (id > 0) {
      // 🔥 **جلب البيانات من خلال الحقول الفريدة**
      String whereClause = uniqueColumns.map((col) => "$col = ?").join(" AND ");
      List<dynamic> whereArgs = uniqueColumns.map((col) => data[col]).toList();

      final result =
          await db.query(table, where: whereClause, whereArgs: whereArgs);
      for (var item in result) {
        print(item);
        return result.isNotEmpty ? fromJson(item) : null;
      }
    }
    return null;
  }
}
