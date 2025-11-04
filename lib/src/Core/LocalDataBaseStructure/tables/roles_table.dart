import 'package:getx_base_code/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateRolesTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        TablesNames.rolesUsersTable: '''
        CREATE TABLE ${TablesNames.rolesUsersTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          role_name TEXT NOT NULL,
          is_active INTEGER NOT NULL DEFAULT 1
        )
      ''',
      };
}
