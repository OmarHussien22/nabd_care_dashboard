import 'package:care_desk/src/Core/LocalDataBaseStructure/tables/clinic_tables.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/tables/roles_table.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/tables/users_table.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../Constants/Strings/app_strings.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<void> deleteDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, AppStrings.dbName);
    await databaseFactory.deleteDatabase(path);
    printDM("Success Deleting Database: $path");
  }

  Future<void> clearTable({required String tableName}) async {
    final db = await DatabaseHelper.instance.database;
    await db.transaction((txn) async {
      await txn.delete(tableName);
      printDM("✅ $tableName cleared!");
    });
  }

  Future<void> resetDatabase() async {
    final dbPath = await databaseFactoryFfi.getDatabasesPath();
    final path = join(dbPath, 'store.db');
    await databaseFactoryFfi.deleteDatabase(path);
    printDM("✅ Database reset successfully!");

    ///TODO : close app and return run app again
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, AppStrings.dbName);
    printDM("Omar DB Path: $path");
    return await openDatabase(
      path,
      version: AppStrings.dbVersion,
      onCreate: (db, version) async {
        await onCreate(db, version);
      },
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> onCreate(Database db, int version) async {
    Map<String, String> tables = {};
    tables.addAll(CreateRolesTable().createTable());
    tables.addAll(CreateUsersTable().createTable());
    tables.addAll(CreateDoctorsTable().createTable());
    tables.addAll(CreatePatientsTable().createTable());
    tables.addAll(CreateBookingsTable().createTable());

    for (var table in tables.entries) {
      await db.execute(table.value);
    }
  }

  // Future<void> inquiryDataBase() async {
    // Legacy query removed as it depended on tables being removed
  // }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
    }
  }
}
