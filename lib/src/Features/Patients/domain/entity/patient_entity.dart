import 'package:care_desk/src/Features/Patients/domain/entity/attachments_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/disease_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/medicine_entity.dart';

class PatientEntity {
  final int id;
  final String name;
  final String phone;
  final String address;
  final int gender; // 1 for male, 2 for female
  final String dateOfBirth;
  final int visitType; // 1 for new visit, 2 for follow up
  // final String referralType;
  final List<DiseaseEntity> chronicDiseases;
  final List<MedicineEntity> medications;
  final List<AttachmentsEntity> attachments;
  final String mainComplaint; // الشكوى الرئيسيه
  final String allergies; // الحساسيه
  final String notes;
  final String age;
  final String bookingDate;
  final String bookingTime;
  final String price;
  final String date;
  final String time;
  final int status; // 1 for new book, 2 for reserved, 3 for completed
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  PatientEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.gender,
    required this.dateOfBirth,
    required this.visitType,
    // required this.referralType,
    required this.chronicDiseases,
    required this.medications,
    required this.attachments,
    required this.mainComplaint,
    required this.allergies,
    required this.notes,
    required this.age,
    required this.bookingDate,
    required this.bookingTime,
    required this.price,
    required this.date,
    required this.time,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  static PatientEntity empty = PatientEntity(
    id: 0,
    name: '',
    phone: '',
    address: '',
    gender: 0,
    dateOfBirth: '',
    visitType: 0,
    chronicDiseases: DiseaseEntity.emptyList,
    medications: MedicineEntity.emptyList,
    attachments: AttachmentsEntity.emptyList,
    mainComplaint: '',
    allergies: '',
    notes: '',
    age: '',
    bookingDate: '',
    bookingTime: '',
    price: '',
    date: '',
    time: '',
    status: 0,
    createdAt: '',
    updatedAt: '',
    deletedAt: '',
  );

  static List<PatientEntity> get emptyList => [
        PatientEntity.empty,
        PatientEntity.empty,
        PatientEntity.empty,
        PatientEntity.empty,
      ];
}
