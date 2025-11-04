import 'package:getx_base_code/src/Core/LocalDataBaseStructure/tables/categories_table.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/tables/products_table.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/tables/roles_table.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/tables/sub_categories_table.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/tables/users_table.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
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
    await deleteDatabase();
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
        inquiryDataBase();
        // await inquiryDataBase();

        // await _insertInitialData(db);
      },
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> onCreate(Database db, int version) async {
    Map<String, String> tables = {};
    tables.addAll(CreateRolesTable().createTable());
    tables.addAll(CreateUsersTable().createTable());
    tables.addAll(CreateCategoriesTable().createTable());
    tables.addAll(CreateProductsTable().createTable());
    tables.addAll(CreateSubcategoriesTable().createTable());
    // tables.addAll(CreateOrdersTable().createTable());
    // tables.addAll(CreateReturnsTable().createTable());
    // tables.addAll(CreateBranchesTable().createTable());
    // tables.addAll(CreateSalesTable().createTable());
    // tables.addAll(CreateSalesCommissionsTable().createTable());
    //tables.addAll(CreateRevenueTable().createTable());

    for (var table in tables.entries) {
      await db.execute(table.value);
    }
    //   bool tableExists =
    //       await CheckTableExists.checkIfTableExists(db, table.key);
    //   printDM("Omar Tables ${table.key} exists: $tableExists");
    //  // await inquiryDataBase();
    //   if (!tableExists) {
    //     printDM("Creating table: ${table.key}");
    //     await db.execute(table.value);
    //   } else {
    //     printDM("Table ${table.key} already exists, skipping creation.");
    //   }
    // }
  }

  Future<void> inquiryDataBase() async {
    final result = await _database!.rawQuery('''
    SELECT subcategories.*, categories.name_ar AS category_name_ar, categories.name_en AS category_name_en
    FROM subcategories
    JOIN categories ON subcategories.category_id = categories.id
  ''');
    printDM("Omar Table Info: $result");
  }

  // Future<void> _insertInitialData(Database db) async {
  //   await db.insert('roles', {'id': 1, 'name': 'admin'});
  //   await db.insert('roles', {'id': 2, 'name': 'user'});
  // }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // await db.execute(
      //     "ALTER TABLE ${TablesNames.categoriesTable} ADD COLUMN name_ar TEXT");
    }
  }
}
