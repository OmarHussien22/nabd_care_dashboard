import 'package:care_desk/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class CreateSubcategoriesTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        TablesNames.subcategoriesTable: '''
        CREATE TABLE ${TablesNames.subcategoriesTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name_ar TEXT NOT NULL,
          name_en TEXT NOT NULL,
          category_id INTEGER NOT NULL,
          UNIQUE(name_ar, category_id),
          UNIQUE(name_en, category_id),
          FOREIGN KEY (category_id) REFERENCES ${TablesNames.categoriesTable}(id)
            ON DELETE CASCADE ON UPDATE CASCADE
        )
      ''',
      };
}
