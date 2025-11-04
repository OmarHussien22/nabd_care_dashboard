import 'package:getx_base_code/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';


class CloseDatabaseMethod {
  static final CloseDatabaseMethod instance = CloseDatabaseMethod._();
  CloseDatabaseMethod._();

  Future<LocalResponse> close() async {
    final db = await DatabaseHelper.instance.database;
    await db.close();
    return LocalResponse(
      data: null,
      statusCode: 200,
      statusMessage: 'تمت العملية بنجاح',
    );
  }
}
