import 'package:care_desk/Src/core/NetworkStructure/Networking/src/Utils/network_utils.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:care_desk/src/Core/NetworkStructure/Resources/Errors/error_model.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Core/params/local_params.dart';
import 'package:care_desk/src/Features/LocalAuth/data/models/local_user_model.dart';
import 'package:care_desk/src/Features/LocalAuth/login_user_params.dart';

enum TypeOrderBy {
  ASC, // ترتيب تصاعدي
  DESC, // ترتيب تنازلي
}

class GetDataBaseMethod {
  static final GetDataBaseMethod instance = GetDataBaseMethod._();
  GetDataBaseMethod._();

  final _utils = NetworkUtils.instance;

  Future<LocalResponse<dynamic>> fetch({
  required String tableName,
  dynamic whereArgs, // 👈 بدل LocalParams فقط
  String? where,
  String? orderedBy,
  TypeOrderBy typeOrderBy = TypeOrderBy.DESC,
  int? limit,
  bool singleResult = false,
  bool showLoading = false,
}) async {
  try {
    if (showLoading) _utils.showDialog(true);

    if (tableName.isEmpty) {
      throw Exception("❌ Table name is required for FETCH");
    }

    final db = await DatabaseHelper.instance.database;

    /// ✅ تحويل whereArgs حسب النوع
    final args = whereArgs == null
        ? null
        : (whereArgs is LocalParams
            ? whereArgs.toJson().values.toList()
            : (whereArgs is List ? whereArgs : [whereArgs]));

    final result = await db.query(
      tableName,
      where: where,
      whereArgs: args,
      orderBy: orderedBy != null ? "$orderedBy ${typeOrderBy.name}" : null,
      limit: limit,
    );

    printDM("✅ Fetch query result: $result");

    if (result.isEmpty) {
      return LocalResponse(
        data: ErrorModel(
          title: 'لا يوجد بيانات',
          message: 'الجدول $tableName فارغ',
          type: ErrorType.dataEmpty,
        ),
        statusCode: 204,
        statusMessage: 'لا يوجد بيانات',
      );
    }

    return LocalResponse(
      data: singleResult ? result.first : result,
      statusCode: 200,
      statusMessage: 'تمت العملية بنجاح',
    );
  } catch (e) {
    printDM("❌ Error in fetch query: $e");
    return LocalResponse(
      data: singleResult ? {} : [],
      statusCode: 500,
      statusMessage: 'حدث خطأ ${e.toString()}',
    );
  } finally {
    if (showLoading) _utils.closeDialog(true);
  }
}

  /// ✅ **جلب بيانات المستخدم عبر `phone` و `password`**
  Future<LocalUserModel?> getUser({
    required String phone,
    required String password,
  }) async {
    final response = await fetch(
      tableName: 'users',
      where: 'phone = ? AND password = ?',
      whereArgs: LoginUserParams(phone: phone, password: password),
      limit: 1,
      singleResult: true, 
    );

    if (response.statusCode == 200 && response.data != null) {
      return LocalUserModel.fromJson(response.data);
    }
    return null;
  }
}
