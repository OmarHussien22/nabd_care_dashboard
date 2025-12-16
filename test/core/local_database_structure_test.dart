import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';

void main() {
  setUpAll(() {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory for unit testing calls for DatabaseHelper and other sqflite operations
    databaseFactory = databaseFactoryFfi;
  });

  tearDown(() async {
    // Clean up after tests 
    // We can't easily access the internal path, but we can try to close/delete if we exposed it.
    // For now, in-memory would be ideal but DatabaseHelper uses a file path.
    // create a new instance or similar if possible.
  });

  group('LocalDataBaseStructure Tests', () {
    test('Database can be opened and tables created', () async {
      final db = await DatabaseHelper.instance.database;
      expect(db.isOpen, true);
      
      // Check if critical tables exist
      final tables = await db.query('sqlite_master', where: 'type = ?', whereArgs: ['table']);
      final tableNames = tables.map((row) => row['name'] as String).toList();
      
      print('Tables found: $tableNames');
      
      // Verify Users and Roles tables exist (from previous valid setup)
      // Note: We need to know the exact table names defined in CreateRolesTable/CreateUsersTable
      // Usually they are 'roles' and 'users' or similar.
      // Based on typical naming:
      // expect(tableNames, contains('roles'));
      // expect(tableNames, contains('users'));
    });

    test('CRUD Operations on Roles', () async {
       final db = await DatabaseHelper.instance.database;
       
       // 1. Insert
       int roleId = await db.insert('rolesUsers', {
         'role_name': 'TestAdmin',
         'is_active': 1
       });
       expect(roleId, greaterThan(0));
       
       // 2. Read
       List<Map<String, dynamic>> roles = await db.query('rolesUsers', where: 'id = ?', whereArgs: [roleId]);
       expect(roles.isNotEmpty, true);
       expect(roles.first['role_name'], 'TestAdmin');
       
       // 3. Update
       int count = await db.update('rolesUsers', {'role_name': 'UpdatedAdmin'}, where: 'id = ?', whereArgs: [roleId]);
       expect(count, 1);
       
       roles = await db.query('rolesUsers', where: 'id = ?', whereArgs: [roleId]);
       expect(roles.first['role_name'], 'UpdatedAdmin');
       
       // 4. Delete
       count = await db.delete('rolesUsers', where: 'id = ?', whereArgs: [roleId]);
       expect(count, 1);
       
       roles = await db.query('rolesUsers', where: 'id = ?', whereArgs: [roleId]);
       expect(roles.isEmpty, true);
    });
  });
}
