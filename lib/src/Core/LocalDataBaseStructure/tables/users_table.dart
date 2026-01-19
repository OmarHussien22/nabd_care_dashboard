import 'package:care_desk/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateUsersTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        TablesNames.usersTable: '''
        CREATE TABLE ${TablesNames.usersTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT UNIQUE NOT NULL,
          phone TEXT NOT NULL,
          password TEXT NOT NULL,
          role_id INTEGER NOT NULL,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          is_active INTEGER NOT NULL DEFAULT 1,
          FOREIGN KEY (role_id) REFERENCES ${TablesNames.rolesUsersTable}(id) ON DELETE CASCADE
        )
      ''',
      };
}
// email TEXT UNIQUE NOT NULL,
