import 'package:care_desk/src/Features/Patients/data/model/attachments_model.dart';
import 'package:care_desk/src/Features/Patients/data/model/disease_model.dart';
import 'package:care_desk/src/Features/Patients/data/model/medicine_model.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';

class PatientModel extends PatientEntity {
  PatientModel({
    required super.id,
    required super.title,
    required super.phone,
    required super.address,
    required super.gender,
    required super.dateOfBirth,
    required super.visitType,
    required super.chronicDiseases,
    required super.medications,
    required super.attachments,
    required super.mainComplaint,
    required super.allergies,
    required super.notes,
    required super.age,
    required super.bookingDate,
    required super.bookingTime,
    required super.price,
    required super.date,
    required super.time,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.deletedAt,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'] ?? 0,
      title: json['name'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      gender: json['gender'] ?? 0,
      dateOfBirth: json['date_of_birth'] ?? '',
      visitType: json['visit_type'] ?? 0,
      chronicDiseases: json['chronic_diseases'] != null
          ? (json['chronic_diseases'] as List)
                .map((e) => DiseaseModel.fromJson(e))
                .toList()
          : [],
      medications: json['medications'] != null
          ? (json['medications'] as List)
                .map((e) => MedicineModel.fromJson(e))
                .toList()
          : [],
      attachments: json['attachments'] != null
          ? (json['attachments'] as List)
                .map((e) => AttachmentsModel.fromJson(e))
                .toList()
          : [],
      mainComplaint: json['main_complaint'] ?? '',
      allergies: json['allergies'] ?? '',
      notes: json['notes'] ?? '',
      age: json['age'] ?? '',
      bookingDate: json['booking_date'] ?? '',
      bookingTime: json['booking_time'] ?? '',
      price: json['price'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      deletedAt: json['deleted_at'] ?? '',
    );
  }
}