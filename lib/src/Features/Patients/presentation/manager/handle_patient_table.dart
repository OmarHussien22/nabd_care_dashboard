import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/dynamic_table.dart';
import 'package:flutter/material.dart';

class HandlePatientTable {
  HandlePatientTable._();
  static final HandlePatientTable instance = HandlePatientTable._();
  final List<TableColumn> patientColumns = [
    TableColumn(label: "ID", width: 80),
    TableColumn(label: "Name", width: 200),
    TableColumn(label: "Age", width: 80),
    TableColumn(label: "Booking Day", width: 140),
    TableColumn(label: "Status", width: 130),
    TableColumn(label: "Price", width: 110),
    TableColumn(label: "Visit Type", width: 120),
    TableColumn(label: "Phone", width: 140),
    //TableColumn(label: "Attachments", width: 120),
  ];

  //  String statusLabel(int status) {
  //   switch (status) {
  //     case 1:
  //       return 'New Book';
  //     case 2:
  //       return 'Reserved';
  //     case 3:
  //       return 'Completed';
  //     default:
  //       return 'Unknown';
  //   }
  // }

   Color statusColor(int status) {
    switch (status) {
      case 1:
        return AppColors.get.yellow;
      case 2:
        return AppColors.get.orange;
      case 3:
        return AppColors.get.green;
      default:
        return AppColors.get.greyLight;
    }
  }


}
