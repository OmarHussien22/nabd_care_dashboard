import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/mixin_has_id.dart';
import 'package:getx_base_code/src/Core/params/local_params.dart';

class UpdateCategoryParams extends LocalParams with HasId {
  @override
  final int id;
  final String nameAr;
  final String nameEn;

  UpdateCategoryParams({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "name_ar": nameAr,
      "name_en": nameEn,
    };
  }
}
