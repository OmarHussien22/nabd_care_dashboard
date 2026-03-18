import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Features/Appointments/presentation/pages/appointments_page.dart';
import 'package:care_desk/src/Features/Dashboard/presentation/pages/dashboard_page.dart';
import 'package:care_desk/src/Features/Patients/presentation/pages/add_patient_page.dart';
import 'package:care_desk/src/Features/Patients/presentation/pages/patients_page.dart';
import 'package:care_desk/src/Features/settings/presentation/pages/settings_page.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Inner navigator key used by the dashboard shell.
/// All sub‑page navigation goes through this key, so the Sidebar never rebuilds.
final GlobalKey<NavigatorState> dashboardNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'dashboardNavigator');

class MainLayoutController extends GetControllerInterface {
  bool isSidebarCollapsed = false;
  int selectedIndex = 0;
  bool isOffline = false;

  // ── Route → sidebar index mapping ──────────────────────────────────────────
  static const Map<String, int> _routeIndexMap = {
    AppRoutes.dashboard: 0,
    AppRoutes.appointments: 1,
    AppRoutes.patients: 2,
    AppRoutes.addPatient: 2, // add-patient keeps "Patients" highlighted
    AppRoutes.testAppointments: 2, // test page kept under Appointments
    AppRoutes.settings: 5,
  };

  // ── Named routes rendered INSIDE the inner navigator ───────────────────────
  static Route<dynamic>? onGenerateInnerRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case AppRoutes.dashboard:
        page = const DashboardPage();
        break;
      case AppRoutes.appointments:
        page = const AppointmentsPage();
        break;
      case AppRoutes.patients:
        page = const PatientsPage();
        break;
      case AppRoutes.addPatient:
        page = const AddPatientPage();
        break;
      case AppRoutes.testAppointments:
        page = const TestAppointmentsPage();
        break;
      case AppRoutes.settings:
        page = const SettingsPage();
        break;
      default:
        page = const DashboardPage();
    }
    return MaterialPageRoute(settings: settings, builder: (_) => page);
  }

  // ── Sidebar navigation ─────────────────────────────────────────────────────

  /// Navigate to a named route inside the inner Navigator (sidebar stays fixed).
  void navigateTo(String routeName) {
    dashboardNavigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false, // clear the back-stack when changing main sections
    );
  }

  /// Called when a sidebar item is tapped.
  void selectItem(int index) {
    if (selectedIndex == index) return;
    selectedIndex = index;
    update();

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
  }

  /// Push a sub-page without clearing history (back button will work).
  void pushPage(String routeName) {
    dashboardNavigatorKey.currentState?.pushNamed(routeName);
  }

  /// Go back one page inside the inner navigator.
  void popPage() {
    if (dashboardNavigatorKey.currentState?.canPop() ?? false) {
      dashboardNavigatorKey.currentState?.pop();
    }
  }

  /// Called by [_SidebarRouteObserver] when a route is shown.
  void onRouteShown(String? routeName) {
    if (routeName == null) return;
    final index = _routeIndexMap[routeName];
    if (index != null && index != selectedIndex) {
      selectedIndex = index;
      update();
    }
  }

  // ── Lifecycle ───────────────────────────────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    // Default to Dashboard on launch
    selectedIndex = 0;
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

/// A [NavigatorObserver] that notifies [MainLayoutController] whenever the
/// active route inside the inner navigator changes, so the sidebar highlight
/// is always in sync.
class _SidebarRouteObserver extends NavigatorObserver {
  void _sync(Route<dynamic>? route) {
    if (Get.isRegistered<MainLayoutController>()) {
      Get.find<MainLayoutController>().onRouteShown(route?.settings.name);
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) => _sync(route);
  @override
  void didPop(Route route, Route? previousRoute) => _sync(previousRoute);
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) => _sync(newRoute);
}

/// Single shared observer instance.
final sidebarRouteObserver = _SidebarRouteObserver();
