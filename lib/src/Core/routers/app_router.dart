// lib/src/Core/App/app_router.dart

part of 'app_router_imports.dart';

class AppRouter {
  // Helper to wrap a page with the Dashboard shell
  static GetPage shellPage({required String name, required Widget page}) {
    return GetPage(
      name: name,
      page: () => MainLayout(child: page),
      transition: Transition.noTransition, // Keeps shell steady during swap
    );
  }

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),

    // Dashboard Routes (all wrapped with MainLayout)
    shellPage(name: AppRoutes.mainApp, page: const DashboardPage()),
    shellPage(name: AppRoutes.dashboard, page: const DashboardPage()),
    shellPage(name: AppRoutes.appointments, page: const AppointmentsPage()),
    shellPage(name: AppRoutes.patients, page: const PatientsPage()),
    shellPage(name: AppRoutes.addPatient, page: const AddPatientPage()),
    shellPage(name: AppRoutes.patientDetails, page: const PatientDetailsPage()),
    shellPage(name: AppRoutes.testAppointments, page: const TestAppointmentsPage()),
    shellPage(name: AppRoutes.settings, page: const SettingsPage()),
  ];

  static final GetPage<dynamic> unknownRoute = GetPage(
    name: '/404',
    page: () => const Scaffold(
      body: Center(child: Text('Routing error')),
    ),
  );
}
