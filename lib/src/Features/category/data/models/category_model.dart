import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.nameAr,
    required super.nameEn,
    super.isActive = 1,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      nameAr: json['name_ar'] ?? "",
      nameEn: json['name_en'] ?? "",
      isActive: json['is_active'] ?? 1,
      // description: json['description'],
    );
  }
}
