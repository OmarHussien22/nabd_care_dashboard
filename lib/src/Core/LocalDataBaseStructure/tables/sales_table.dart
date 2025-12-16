import 'package:care_desk/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateSalesTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        TablesNames.salesTable: '''
        CREATE TABLE ${TablesNames.salesTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          product_id INTEGER NOT NULL,
          quantity INTEGER NOT NULL,
          total_price REAL NOT NULL,
          seller_id INTEGER NOT NULL,
          sale_source TEXT NOT NULL, -- Walk-in, Facebook, Instagram
          sale_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
          is_refunded INTEGER NOT NULL DEFAULT 0,
          is_active INTEGER NOT NULL DEFAULT 1,
          FOREIGN KEY (product_id) REFERENCES ${TablesNames.productsTable}(id),
          FOREIGN KEY (seller_id) REFERENCES ${TablesNames.usersTable}(id)
        )
      ''',
      };
}
