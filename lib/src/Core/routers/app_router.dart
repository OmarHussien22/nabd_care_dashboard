// lib/src/Core/App/app_router.dart

part of 'app_router_imports.dart';

// If you had custom transitions in route_transitions.dart, you can
// map them here via `transition:` or `customTransition:`, see note below.

class AppRouter {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),

    // اجعل الـ MainLayout هو الأب لكل صفحات السيستم
    GetPage(
      name: AppRoutes.mainApp,
      page: () => const MainLayout(),
      // binding: MainLayoutBinding(),
      children: [
        GetPage(
          name: AppRoutes.dashboard,
          page: () => const DashboardPage(),
        ),
        GetPage(
          name: AppRoutes.appointments,
          page: () => const AppointmentsPage(),
        ),
        GetPage(
          name: AppRoutes.patients,
          page: () => const PatientsPage(),
          // children: [
          //   GetPage(
          //     name: AppRoutes.addPatient,
          //     page: () => const AddPatient(),
          //   ),
          // ],
        ),
        GetPage(
          name: AppRoutes.addPatient, // /add-patient (مسار مستقل ومباشر)
          page: () => const AddPatientPage(),
        ),
        GetPage(
          name: AppRoutes.settings,
          page: () => const SettingsPage(),
        ),
      ],
    ),
  ];
  static final GetPage<dynamic> unknownRoute = GetPage(
    name: '/404',
    page: () => const Scaffold(
      body: Center(child: Text('Routing error')),
    ),
  );
}
