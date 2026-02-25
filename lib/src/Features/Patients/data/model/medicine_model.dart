
import 'package:care_desk/src/Features/Patients/domain/entity/medicine_entity.dart';

class MedicineModel extends MedicineEntity {
  MedicineModel({
    required super.id,
    required super.name,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
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