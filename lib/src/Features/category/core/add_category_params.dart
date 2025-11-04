import 'package:getx_base_code/src/Core/params/local_params.dart';

class AddCategoryParams extends LocalParams {
  int? id;
  String? nameAr;
  String? nameEn;
  // String? description;

  AddCategoryParams({
    this.id,
    this.nameAr,
    this.nameEn,
    // this.description,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name_ar": nameAr,
      "name_en": nameEn,
      // "description": description,
    };
  }
  //
  // @override
  // Map<String, dynamic> query() {
  //   return {
  //     "name": name,
  //     "description": description,
  //     "is_active": 1,
  //   };
  // }
}
