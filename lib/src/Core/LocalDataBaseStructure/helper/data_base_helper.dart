import 'package:care_desk/src/Core/LocalDataBaseStructure/tables/clinic_tables.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/tables/roles_table.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/tables/users_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../Constants/Strings/app_strings.dart';
import '../../Utils/general_utils.dart';

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
    final dbPath = await databaseFactory.getDatabasesPath();
    final path = join(dbPath, AppStrings.dbName);
    await databaseFactory.deleteDatabase(path);
    printDM("✅ Database deleted: $path");
  }

  Future<void> clearTable({required String tableName}) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete(tableName);
      printDM("✅ $tableName cleared!");
    });
  }

  Future<void> resetDatabase() async {
    final dbPath = await databaseFactory.getDatabasesPath();
    final path = join(dbPath, AppStrings.dbName);
    await databaseFactory.deleteDatabase(path);
    printDM("✅ Database reset successfully!");
  }

  Future<Database> _initDatabase() async {
    final dbPath = await databaseFactory.getDatabasesPath();
    final path = join(dbPath, AppStrings.dbName);
    printDM("📦 DB Path: $path");

    return await openDatabase(
      path,
      version: AppStrings.dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    final tables = <String, String>{}
      ..addAll(CreateRolesTable().createTable())
      ..addAll(CreateUsersTable().createTable())
      ..addAll(CreateDoctorsTable().createTable())
      ..addAll(CreatePatientsTable().createTable())
      ..addAll(CreateBookingsTable().createTable());

    for (final table in tables.entries) {
      await db.execute(table.value);
    }
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // handle migrations
    }
  }
}
