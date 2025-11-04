import 'package:sqflite/sqflite.dart';

class CheckTableExists {
  static Future<bool> checkIfTableExists(Database db, String tableName) async {
    final result = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
        [tableName]);

    return result.isNotEmpty; // إذا كان الجدول موجودًا، سترجع `true`
  }
}
