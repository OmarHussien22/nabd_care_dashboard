import 'package:care_desk/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

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
