import 'package:care_desk/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateReturnsTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        TablesNames.returnsTable: '''
        CREATE TABLE ${TablesNames.returnsTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          order_id INTEGER NOT NULL,
          return_reason TEXT NOT NULL,
          return_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
          is_active INTEGER NOT NULL DEFAULT 1,
          FOREIGN KEY (order_id) REFERENCES ${TablesNames.ordersTable}(id)
        )
      ''',
      };
}
