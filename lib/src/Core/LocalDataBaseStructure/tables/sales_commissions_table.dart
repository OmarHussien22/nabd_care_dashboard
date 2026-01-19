import 'package:care_desk/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateSalesCommissionsTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        TablesNames.salesCommissionsTable: '''
        CREATE TABLE ${TablesNames.salesCommissionsTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          seller_id INTEGER NOT NULL,
          sale_id INTEGER NOT NULL,
          commission_amount REAL NOT NULL,
          commission_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
          FOREIGN KEY (seller_id) REFERENCES ${TablesNames.usersTable}(id),
          FOREIGN KEY (sale_id) REFERENCES ${TablesNames.salesTable}(id)
        )
      ''',
      };
}
