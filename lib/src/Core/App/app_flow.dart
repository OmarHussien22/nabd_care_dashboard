import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:care_desk/src/Core/Services/Storage/storage_service.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';

import '../Constants/Enums/app_source.dart';

class AppFlow {
  AppFlow._();
  static final AppFlow instance = AppFlow._();
  // static AppSource get currentSource => AppSource.prod;
  final StorageService _storageService = StorageService();

  void controlFlow() {

    printDM("App Flow ${IntalizeAppSource.currentSource.toString()}");
    if (IntalizeAppSource.currentSource == AppSource.prod) {
      _prodFlow();
    } else {
      _devFlow();
    }
  }

  /// [controlFlow] manipulates the return Screen  ( Called before the app runs or in Splash Screen )
  ///
  Future<void> _prodFlow() async {
    // final isOnBoardingDone =
    //     _storageService.read(stgOnBoarding, defaultValue: false) ?? false;
    final isLoggedIn =
        _storageService.read("login", defaultValue: false) ?? false;
    printDM('isLoggedIn: $isLoggedIn');
    // if (isOnBoardingDone) {

    if (isLoggedIn) {
      NavigationService.instance.go('/dashboard');
    } else {
      NavigationService.instance.go('/login');
    }
    // } else {
    //   Get.offAll(const OnBoardingPage());
    // }
  }

  void _devFlow() {
    NavigationService.instance.go('/dashboard');
    // Get.offAll(() => const AddCategoryPage());
  }
}
