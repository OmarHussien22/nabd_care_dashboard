import 'package:equatable/equatable.dart';
import 'package:getx_base_code/src/Shared/Entities/title_interface.dart';

class CategoryEntity extends TitleInterface with EquatableMixin {
  @override
  int id;
  String nameAr;
  String nameEn;
  int isActive;

  CategoryEntity({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.isActive = 1,
  }) : super(title: nameAr, subTitle: nameEn, id: id);
  @override
  // TODO: implement props
  List<Object?> get props => [id, nameAr, nameEn, isActive];
}
