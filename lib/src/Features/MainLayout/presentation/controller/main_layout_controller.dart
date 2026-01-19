import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Features/Appointments/presentation/pages/appointments_page.dart';
import 'package:care_desk/src/Features/Dashboard/presentation/pages/dashboard_page.dart';
import 'package:care_desk/src/Features/Patients/presentation/pages/patients_page.dart';
import 'package:care_desk/src/Features/settings/presentation/pages/settings_page.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:flutter/material.dart';

class MainLayoutController extends GetControllerInterface {
  bool isSidebarCollapsed = false;
  int selectedIndex = 0;
  bool isOffline = false; // Mock state

  // Map sidebar index to specific pages
  final Map<int, Widget> pages = {
    0: const DashboardPage(),
    1: const AppointmentsPage(),
    2: const PatientsPage(),
    5: const SettingsPage(),
  };

  // retry for network
  void onRetry() {
    isOffline = false;
    update();
  }

  void toggleNetworkStatus() {
    isOffline = !isOffline;
    update();
  }

  void toggleSidebar(bool val) {
    isSidebarCollapsed = val;
    printDM('isSidebarCollapsed: $isSidebarCollapsed',
        name: 'MainLayoutController');
    update();
  }

  void selectItem(int index) {
    selectedIndex = index;
    update();
  }

   String getPageTitle(int index) {
    switch (index) {
      case 0:
        return "Dashboard";
      case 1:
        return "Appointments";
      case 2:
        return "Patients";
      case 5:
        return "Settings";
      default:
        return "CareDesk";
    }
  }
}
