
import 'package:care_desk/src/Features/Patients/domain/entity/disease_entity.dart';

class DiseaseModel extends DiseaseEntity {
  DiseaseModel({
    required super.id,
    required super.name,
  });

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
  
}