import 'package:getx_base_code/src/Shared/Entities/title_interface.dart';
import 'package:equatable/equatable.dart';

enum EducationType {
  school(1),
  university(2);

  final int id;
  const EducationType(this.id);

  static EducationType fromInt(int? value) {
    if (value == null) return EducationType.school;
    return EducationType.values.firstWhere((element) => element.id == value);
  }
}

class EducationInformation extends TitleInterface with EquatableMixin {
  EducationInformation({
    required super.id,
    required super.title,
    super.subTitle,
    super.children = const [],
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        title,
        subTitle,
        children,
      ];

  static List<EducationInformation> educationTypes = [
    EducationInformation(
      id: 1,
      title: 'basic_education',
      subTitle: 'basic_education',
    ),
    EducationInformation(
      id: 2,
      title: 'university_education',
      subTitle: 'university_education',
    ),
  ];
  static List<EducationInformation> basicEducationTypes = [
    EducationInformation(
      id: 1,
      title: 'basic_education',
      subTitle: 'basic_education',
    ),
  ];

  static List<EducationInformation> universityEducationTypes = [
    EducationInformation(
      id: 2,
      title: 'university_education',
      subTitle: 'university_education',
    ),
  ];
}
