import '../../domain/entities/sub_category_entity.dart';

class SubCategoryModel extends SubCategoryEntity {
  SubCategoryModel({
    required super.id,
    required super.categoryId,
    required super.categoryNameAr,
    required super.categoryNameEn,
    required super.nameAr,
    required super.nameEn,
  });
  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      categoryNameAr: json['category_name_ar'] ?? "",
      categoryNameEn: json['category_name_en'] ?? "",
     nameAr: json['sub_category_name_ar'] ?? json['name_ar'] ?? '',
      nameEn: json['sub_category_name_en'] ?? json['name_en'] ?? '',
      // description: json['description'],
    );
  }
}
