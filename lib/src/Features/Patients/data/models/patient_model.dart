import '../../domain/entities/patient_entity.dart';
import 'package:care_desk/src/Core/Utils/Extensions/json_parsing_extension.dart';

class PatientModel extends PatientEntity {
  const PatientModel({
    required super.id,
    required super.name,
    super.phone,
    super.email,
    super.avatar,
    super.gender,
    super.dateOfBirth,
    super.bloodType,
    super.address,
    super.emergencyContact,
    super.emergencyPhone,
    super.medicalNotes,
    super.isActive = true,
    super.lastVisit,
    super.age,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json.parseInt('id'),
      name: json.parseString('name'),
      phone: json.parseString('phone'),
      email: json.parseString('email'),
      avatar: json.parseString('avatar'),
      gender: json.parseString('gender'),
      dateOfBirth: json.parseString('date_of_birth'),
      bloodType: json.parseString('blood_type'),
      address: json.parseString('address'),
      emergencyContact: json.parseString('emergency_contact'),
      emergencyPhone: json.parseString('emergency_phone'),
      medicalNotes: json.parseString('medical_notes'),
      isActive: json.parseBool('is_active') ?? true,
      lastVisit: json.parseString('last_visit'),
      age: json.parseInt('age'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'avatar': avatar,
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'blood_type': bloodType,
      'address': address,
      'emergency_contact': emergencyContact,
      'emergency_phone': emergencyPhone,
      'medical_notes': medicalNotes,
      'is_active': isActive,
      'last_visit': lastVisit,
      'age': age,
    };
  }
}
