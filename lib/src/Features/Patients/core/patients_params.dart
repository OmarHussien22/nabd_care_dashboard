import 'package:care_desk/src/Core/network_structure/params/params.dart';

class FetchPatientsParams extends Params {
  final int page;
  final int perPage;
  final String? search;
  final String? gender;
  final bool? isActive;

  FetchPatientsParams({
    this.page = 1,
    this.perPage = 10,
    this.search,
    this.gender,
    this.isActive,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      if (search != null) 'search': search,
      if (gender != null) 'gender': gender,
      if (isActive != null) 'is_active': isActive,
    };
  }
}

class AddPatientParams extends Params {
  final String name;
  final String phone;
  final String? email;
  final String? gender;
  final String? bloodType;
  final String? address;
  final String? emergencyContact;
  final String? emergencyPhone;
  final String? medicalNotes;
  final List<String>? chronicDiseases;
  final List<Map<String, String>>? medications;
  final List<Map<String, String>>? attachments;

  AddPatientParams({
    required this.name,
    required this.phone,
    this.email,
    this.gender,
    this.bloodType,
    this.address,
    this.emergencyContact,
    this.emergencyPhone,
    this.medicalNotes,
    this.chronicDiseases,
    this.medications,
    this.attachments,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (bloodType != null) 'blood_type': bloodType,
      if (address != null) 'address': address,
      if (emergencyContact != null) 'emergency_contact': emergencyContact,
      if (emergencyPhone != null) 'emergency_phone': emergencyPhone,
      if (medicalNotes != null) 'medical_notes': medicalNotes,
      if (chronicDiseases != null) 'chronic_diseases': chronicDiseases,
      if (medications != null) 'medications': medications,
      if (attachments != null) 'attachments': attachments,
    };
  }
}

class DeletePatientParams extends Params {
  final int patientId;

  DeletePatientParams({required this.patientId});

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': patientId,
    };
  }
}
