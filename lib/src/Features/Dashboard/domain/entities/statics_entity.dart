import 'package:care_desk/src/Features/Dashboard/domain/entities/total_statics_entity.dart';

class StaticsEntity {
  final TotalStaticsEntity patientsCount;
  final TotalStaticsEntity appointmentsCount;
  final TotalStaticsEntity revenueCount;
  final TotalStaticsEntity activeDoctorsCount;

  StaticsEntity({
    required this.patientsCount,
    required this.appointmentsCount,
    required this.revenueCount,
    required this.activeDoctorsCount,
  });

  factory StaticsEntity.fromJson(Map<String, dynamic> json) {
    return StaticsEntity(
      patientsCount: TotalStaticsEntity.fromJson(json['patients_count']),
      appointmentsCount:
          TotalStaticsEntity.fromJson(json['appointments_count']),
      revenueCount: TotalStaticsEntity.fromJson(json['revenue_count']),
      activeDoctorsCount:
          TotalStaticsEntity.fromJson(json['active_doctors_count']),
    );
  }
}
