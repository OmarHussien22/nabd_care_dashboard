import '../../../Core/params/local_params.dart';

class AddSubCategoryParams extends LocalParams {
  int? id;
  int? categoryId;
  String? nameAr;
  String? nameEn;
  // String? description;

  AddSubCategoryParams({
    this.id,
    this.categoryId,
    this.nameAr,
    this.nameEn,
    // this.description,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "category_id": categoryId,
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
