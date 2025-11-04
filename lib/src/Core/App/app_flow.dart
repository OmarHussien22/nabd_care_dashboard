import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Services/Storage/storage_service.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/Auth/presentation/pages/imports_auth.dart';
import 'package:getx_base_code/src/Features/Base/presentation/pages/base_page.dart';

import '../Constants/Enums/app_source.dart';

class AppFlow {
  AppFlow._();
  static final AppFlow instance = AppFlow._();
  static AppSource get currentSource => AppSource.prod;
  final StorageService _storageService = StorageService();
  void controlFlow() {
    if (currentSource == AppSource.prod) {
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
      Get.offAll(() => const BasePage());
    } else {
      Get.offAll(() => const LoginPage());
    }
    // } else {
    //   Get.offAll(const OnBoardingPage());
    // }
  }

  void _devFlow() {
    Get.offAll(() => const LoginPage());
    // Get.offAll(() => const AddCategoryPage());
  }
}
