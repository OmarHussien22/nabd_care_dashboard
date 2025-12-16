import 'package:care_desk/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateBranchesTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        TablesNames.branchesTable: '''
        CREATE TABLE ${TablesNames.branchesTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          location TEXT NOT NULL,
          is_active INTEGER NOT NULL DEFAULT 1
        )
      ''',
      };
}
