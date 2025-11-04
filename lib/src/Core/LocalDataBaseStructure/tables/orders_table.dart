import 'package:getx_base_code/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateOrdersTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        TablesNames.ordersTable: '''
        CREATE TABLE ${TablesNames.ordersTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER NOT NULL,
          total_price REAL NOT NULL,
          order_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
          is_active INTEGER NOT NULL DEFAULT 1,
          FOREIGN KEY (user_id) REFERENCES ${TablesNames.usersTable}(id)
        )
      ''',
      };
}
