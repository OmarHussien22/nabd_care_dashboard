import 'package:care_desk/src/core/network_structure/params/params.dart';

class PatientDetailsParams extends Params {
  final int patientId;

  PatientDetailsParams({required this.patientId});

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': patientId,
      'patient_id': patientId,
    };
  }

  @override
  Map<String, dynamic> query() {
    return {
      'id': patientId,
      'patient_id': patientId,
    };
  }
}

