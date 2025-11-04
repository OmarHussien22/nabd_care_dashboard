import 'package:equatable/equatable.dart';

class SubCategoryEntity with EquatableMixin {
  final int id;
  final int categoryId;
  final String categoryNameAr;
  final String categoryNameEn;
  final String nameAr;
  final String nameEn;

  SubCategoryEntity({
    required this.id,
    required this.categoryId,
    required this.categoryNameAr,
    required this.categoryNameEn,
    required this.nameAr,
    required this.nameEn,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        categoryId,
        nameAr,
        nameEn,
        categoryNameAr,
        categoryNameEn,
      ];
}
