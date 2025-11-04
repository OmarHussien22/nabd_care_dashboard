import 'package:getx_base_code/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateRevenueTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        TablesNames.revenue: '''
        CREATE TABLE ${TablesNames.revenue} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          total_income REAL NOT NULL,
          total_expenses REAL NOT NULL,
          net_profit REAL NOT NULL,
          revenue_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
        )
      ''',
      };
}
