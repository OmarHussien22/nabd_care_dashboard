import 'package:care_desk/src/Shared/Entities/title_interface.dart';

class GenderEntity extends TitleInterface {
  GenderEntity({
    required super.id,
    required super.title,
  });

  static List<GenderEntity> getGenderList = [
    GenderEntity(id: 1, title: "male"),
    GenderEntity(id: 2, title: "female"),
  ];
}

class VisitTypeEntity extends TitleInterface {
  VisitTypeEntity({
    required super.id,
    required super.title,
  });

  static List<VisitTypeEntity> getVisitTypeList = [
    VisitTypeEntity(id: 1, title: "new_visit"),
    VisitTypeEntity(id: 2, title: "follow_up"),
  ];
}
