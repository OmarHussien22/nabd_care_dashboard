import 'package:care_desk/src/Core/routers/app_router_imports.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayoutController extends GetxController {
  static MainLayoutController get to => Get.find();

  // Sidebar state
  int selectedIndex = 0;
  bool isSidebarCollapsed = false;
  bool isOffline = false;

  final Map<String, int> _routeIndexMap = {
    AppRoutes.dashboard: 0,
    AppRoutes.appointments: 1,
    AppRoutes.patients: 2,
    AppRoutes.addPatient: 2,
    AppRoutes.patientDetails: 2,
    AppRoutes.settings: 5,
  };

  String getPageTitle(int index) {
    // update();
    switch (index) {
      case 0:
        return "dashboard".tr;
      case 1:
        return "appointments".tr;
      case 2:
        return "patients".tr;
      case 5:
        return "settings".tr;
      default:
        return "";
    }
  }

  void toggleSidebar(bool value) {
    isSidebarCollapsed = value;
    update();
  }

  void selectItem(int index) {
    if (selectedIndex == index) return;
    selectedIndex = index;

    switch (index) {
      case 0:
        navigateTo(AppRoutes.dashboard);
        break;
      case 1:
        navigateTo(AppRoutes.appointments);
        break;
      case 2:
        navigateTo(AppRoutes.patients);
        break;
      case 5:
        navigateTo(AppRoutes.settings);
        break;
    }
    update();
  }

  void navigateTo(String routeName) {
    Get.offNamed(routeName); // Root navigation updates URL
  }

  void pushPage(String routeName) {
    Get.toNamed(routeName); // Root navigation updates URL + history
  }

  void pushReplacementPage(String routeName) {
    Get.offNamed(routeName);
  }

  void pushAndRemoveUntil(String routeName) {
    Get.offAllNamed(routeName);
  }

  void popPage() {
    Get.back();
  }

  void onRouteShown(String? routeName) {
    if (routeName == null) return;
    final index = _routeIndexMap[routeName];
    if (index != null && index != selectedIndex) {
      selectedIndex = index;
      update();
    }
  }

  void get toggleNetworkStatus {
    isOffline = !isOffline;
    update();
  }

  void onRetry() {
    toggleNetworkStatus;
    update();
  }
   @override
  void onInit() {
    super.onInit();
    // Default to Dashboard on launch
    selectedIndex = 0;
  }
}

class SidebarRouteObserver extends GetObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (Get.isRegistered<MainLayoutController>()) {
      Get.find<MainLayoutController>().onRouteShown(route.settings.name);
    }
  }
}

final sidebarRouteObserver = SidebarRouteObserver();
