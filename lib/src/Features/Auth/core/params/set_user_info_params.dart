import '../../../../Core/NetworkStructure/Params/params.dart';

class SetUserInfoParams extends Params {
  int? categoryId;

  /// اساسي و جامعي
  int? basicEducationTypeId;
  int? stageId;
  int? yearId;
  int? universityEducationTypeId;
  int? universityId;
  int? collegeId;
  int? departmentId;
  int? divisionId;
  List<int>? subjectIds;

  SetUserInfoParams({
    this.categoryId,
    this.basicEducationTypeId,
    this.stageId,
    this.yearId,
    this.universityEducationTypeId,
    this.universityId,
    this.collegeId,
    this.departmentId,
    this.divisionId,
    this.subjectIds,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      if (categoryId != null && categoryId != -1) 'category_id': categoryId,
      if (basicEducationTypeId != null && basicEducationTypeId != -1)
        'basic_education_type_id': basicEducationTypeId,
      if (stageId != null && stageId != -1) 'stage_id': stageId,
      if (yearId != null && yearId != -1) 'year_id': yearId,
      if (universityEducationTypeId != null && universityEducationTypeId != -1)
        'university_education_type_id': universityEducationTypeId,
      if (universityId != null && universityId != -1)
        'university_id': universityId,
      if (collegeId != null && collegeId != -1) 'college_id': collegeId,
      if (departmentId != null && departmentId != -1)
        'department_id': departmentId,
      if (divisionId != null && divisionId != -1) 'division_id': divisionId,
      if (subjectIds != null && subjectIds!.isNotEmpty)
        'subject_ids[]': subjectIds,
    };
  }
}
