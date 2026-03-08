import 'package:care_desk/src/Features/Patients/domain/entity/upload_attachments.dart';
import 'package:care_desk/src/core/network_structure/params/params.dart' show Params;

class AddPatinetParams extends Params {
  final String name;
  final String phone;
  final String address;
  final String mainComplaint;
  final String allergies;
  final String notes;
  final String dateOfBirth;
  final int referralSource;
  final int gender;
  final int visitType;
  final List<int> chronicDiseases;
  final List<int> medications;
  final List<UploadAttachment> attachments;

  AddPatinetParams({
    required this.name,
    required this.phone,
    required this.address,
    required this.mainComplaint,
    required this.allergies,
    required this.notes,
    required this.dateOfBirth,
    required this.referralSource,
    required this.gender,
    required this.visitType,
    required this.chronicDiseases,
    required this.medications,
    required this.attachments,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "address": address,
      "main_complaint": mainComplaint,
      "allergies": allergies,
      "notes": notes,
      "date_of_birth": dateOfBirth,
      "referral_source": referralSource,
      "gender": gender,
      "visit_type": visitType,
      "chronic_diseases": chronicDiseases,
      "medications": medications,
      "attachments": attachments,
    };
  }

  @override
  String toString() {
    return "AddPatinetParams(name: $name, phone: $phone, address: $address, mainComplaint: $mainComplaint, allergies: $allergies, notes: $notes, dateOfBirth: $dateOfBirth, referralSource: $referralSource, gender: $gender, visitType: $visitType, chronicDiseases: $chronicDiseases, medications: $medications, attachments: $attachments)";
  }
}
