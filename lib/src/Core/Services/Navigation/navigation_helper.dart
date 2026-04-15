// import 'package:care_desk/src/Features/Appointments/presentation/pages/appointments_page.dart';
// import 'package:care_desk/src/Features/Dashboard/presentation/pages/dashboard_page.dart';
// import 'package:care_desk/src/Features/Patients/presentation/pages/add_patient_page.dart';
// import 'package:care_desk/src/Features/Patients/presentation/pages/patients_page.dart';
// import 'package:care_desk/src/Features/settings/presentation/pages/settings_page.dart';
// import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
// import 'package:flutter/material.dart';

// import '../../routers/app_router_imports.dart';

// class NavigationHelper extends GetControllerInterface {
//   final GlobalKey<NavigatorState> dashboardNavigatorKey =
//       GlobalKey<NavigatorState>(debugLabel: 'dashboardNavigator');

//   // ── Route → sidebar index mapping ──────────────────────────────────────────

//   final Map<String, int> routeIndexMap = {
//     AppRoutes.dashboard: 0,
//     AppRoutes.appointments: 1,
//     AppRoutes.patients: 2,
//     AppRoutes.addPatient: 2, // add-patient keeps "Patients" highlighted
//     AppRoutes.testAppointments: 2, // test page kept under Appointments
//     AppRoutes.settings: 5,
//   };

//   // ── Named routes rendered INSIDE the inner navigator ───────────────────────
//   Route<dynamic>? onGenerateInnerRoute(RouteSettings settings) {
//     Widget page;
//     switch (settings.name) {
//       case AppRoutes.dashboard:
//         page = const DashboardPage();
//         break;
//       case AppRoutes.appointments:
//         page = const AppointmentsPage();
//         break;
//       case AppRoutes.patients:
//         page = const PatientsPage();
//         break;
//       case AppRoutes.addPatient:
//         page = const AddPatientPage();
//         break;
//       case AppRoutes.testAppointments:
//         page = const TestAppointmentsPage();
//         break;
//       case AppRoutes.settings:
//         page = const SettingsPage();
//         break;
//       default:
//         page = const DashboardPage();
//     }
//     update();
//     return MaterialPageRoute(settings: settings, builder: (_) => page);
//   }

//   // ── Sidebar navigation ─────────────────────────────────────────────────────

//   /// Navigate to a named route inside the inner Navigator (sidebar stays fixed).
//   void navigateTo(String routeName) {
//     dashboardNavigatorKey.currentState?.pushNamedAndRemoveUntil(
//       routeName,
//       (route) => false, // clear the back-stack when changing main sections
//     );
//     update();
//   }

//   /// Push a sub-page without clearing history (back button will work).
//   void pushPage(String routeName) {
//     dashboardNavigatorKey.currentState?.pushNamed(routeName);
//     update();
//   }

//   /// Go back one page inside the inner navigator.
//   void popPage() {
//     if (dashboardNavigatorKey.currentState?.canPop() ?? false) {
//       dashboardNavigatorKey.currentState?.pop();
//     }
//     update();
//   }
// }
