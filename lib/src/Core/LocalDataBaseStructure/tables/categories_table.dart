import 'package:care_desk/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateCategoriesTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() {
    return {
      TablesNames.categoriesTable: '''
        CREATE TABLE ${TablesNames.categoriesTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name_ar TEXT NOT NULL,
          name_en TEXT NOT NULL,
          is_active INTEGER DEFAULT 1
        )
      '''
    };
  }
}
//description TEXT,
