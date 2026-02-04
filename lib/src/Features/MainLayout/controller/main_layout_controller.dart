import 'package:care_desk/src/Core/Services/Storage/storage_service.dart';
import 'package:care_desk/src/Core/Services/storage/src/storage_constants.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Features/Appointments/presentation/pages/appointments_page.dart';
import 'package:care_desk/src/Features/Dashboard/presentation/pages/dashboard_page.dart';
import 'package:care_desk/src/Features/Patients/presentation/pages/patients_page.dart';
import 'package:care_desk/src/Features/settings/presentation/pages/settings_page.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayoutController extends GetControllerInterface {
  final StorageService<int> _box = StorageService<int>();

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

  void selectItem(int index) {
    // منع إعادة التحميل إذا ضغط على نفس الصفحة
    if (selectedIndex == index) return;

    selectedIndex = index;
    update();

    switch (index) {
      case 0:
        Get.rootDelegate.toNamed(AppRoutes.dashboard);
        break;
      case 1:
        Get.rootDelegate.toNamed(AppRoutes.appointments);
        break;
      case 2:
        Get.rootDelegate.toNamed(AppRoutes.patients);
        break;
      case 5:
        Get.rootDelegate.toNamed(AppRoutes.settings);
        break;
    }
  }

  void _updateSelectedIndexBasedOnRoute() {
    // كود بسيط لربط الـ URL بالـ Index الصحيح عند فتح التطبيق
    String currentRoute = Get.currentRoute;

    if (currentRoute.contains(AppRoutes.dashboard)) {
      selectedIndex = 0;
    } else if (currentRoute.contains(AppRoutes.appointments)) {
      selectedIndex = 1;
    } else if (currentRoute.contains(AppRoutes.patients)) {
      selectedIndex = 2;
    } else if (currentRoute.contains(AppRoutes.settings)) {
      selectedIndex = 5;
    }
    update();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _updateSelectedIndexBasedOnRoute();
    // selectedIndex = _box.read(stgBNBIndex) ?? 0;
    update();
  }

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
