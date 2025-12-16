import 'package:care_desk/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateProductsTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() {
    return {
      TablesNames.productsTable: '''
        CREATE TABLE ${TablesNames.productsTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          price TEXT NOT NULL,
          quantity INTEGER NOT NULL,
          category_id INTEGER NOT NULL,
          is_active INTEGER DEFAULT 1,
          FOREIGN KEY (category_id) REFERENCES categories(id)
        )
      '''
    };
  }
}
// subcategory_id INTEGER NOT NULL,
// is_active INTEGER NOT NULL DEFAULT 1,
