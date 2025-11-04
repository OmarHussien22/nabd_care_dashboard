import 'package:equatable/equatable.dart';

import '../../domain/entities/educational_info_model.dart';

class UserInfo with EquatableMixin {
  int? id;
  int? basicEducationTypeId;
  int? stageId;
  int? yearId;
  int? universityEducationTypeId;
  int? universityId;
  int? collegeId;
  int? departmentId;
  int? divisionId;
  String? basicEducationTypeTitle;
  String? stageTitle;
  String? yearTitle;
  String? universityEducationTypeTitle;
  String? universityTitle;
  String? collegeTitle;
  String? departmentTitle;
  String? divisionTitle;
  List<EducationalInfoModel>? failingSubjects;

  UserInfo({
    this.id,
    this.basicEducationTypeId,
    this.stageId,
    this.yearId,
    this.universityEducationTypeId,
    this.universityId,
    this.collegeId,
    this.departmentId,
    this.divisionId,
    this.basicEducationTypeTitle,
    this.stageTitle,
    this.yearTitle,
    this.universityEducationTypeTitle,
    this.universityTitle,
    this.collegeTitle,
    this.departmentTitle,
    this.divisionTitle,
    this.failingSubjects,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    basicEducationTypeId = json['basic_education_type_id'] ?? 0;
    stageId = json['stage_id'] ?? 0;
    yearId = json['year_id'] ?? 0;
    universityEducationTypeId = json['university_education_type_id'] ?? 0;
    universityId = json['university_id'] ?? 0;
    collegeId = json['college_id'] ?? 0;
    departmentId = json['department_id'] ?? 0;
    divisionId = json['division_id'] ?? 0;
    basicEducationTypeTitle = json['basic_education_type_title'] ?? '';
    stageTitle = json['stage_title'] ?? '';
    yearTitle = json['year_title'] ?? '';
    universityEducationTypeTitle =
        json['university_education_type_title'] ?? '';
    universityTitle = json['university_title'] ?? '';
    collegeTitle = json['college_title'] ?? '';
    departmentTitle = json['department_title'] ?? '';
    divisionTitle = json['division_title'] ?? '';
    failingSubjects = json['failing_subjects'] != null
        ? List<EducationalInfoModel>.from(json['failing_subjects']
            .map((e) => EducationalInfoModel.fromJson(e))
            .toList())
        : [];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'basic_education_type_id': basicEducationTypeId,
      'stage_id': stageId,
      'year_id': yearId,
      'university_education_type_id': universityEducationTypeId,
      'university_id': universityId,
      'college_id': collegeId,
      'department_id': departmentId,
      'division_id': divisionId,
      'basic_education_type_title': basicEducationTypeTitle,
      'stage_title': stageTitle,
      'year_title': yearTitle,
      'university_education_type_title': universityEducationTypeTitle,
      'university_title': universityTitle,
      'college_title': collegeTitle,
      'department_title': departmentTitle,
      'division_title': divisionTitle,
      'failing_subjects': failingSubjects?.map((e) => e.toJson()).toList()
    };
  }

  @override
  List<Object?> get props => [
        id,
        basicEducationTypeId,
        stageId,
        yearId,
        universityEducationTypeId,
        universityId,
        collegeId,
        departmentId,
        divisionId,
        basicEducationTypeTitle,
        stageTitle,
        yearTitle,
        universityEducationTypeTitle,
        universityTitle,
        collegeTitle,
        departmentTitle,
        divisionTitle,
        failingSubjects,
      ];
}
