import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/Auth/presentation/pages/imports_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Services/Storage/storage_service.dart';
import '../../../../Core/Services/storage/src/storage_constants.dart';
import '../../data/models/onboarding_data.dart';
import '../../data/models/onboarding_model.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  List<OnBoardingModel> data = OnBoardingData.displayedList;
  bool isLastPage = false;
  int currentIndex = 0;

  StorageService box = StorageService<bool>();

  Future<void> _saveOnBoardingDone({bool navigate = false}) async {
    box
        .save(
      stgOnBoarding,
      value: true,
    )
        .then((_) {
      // Get.offAll(const LoginPage());
    });
  }

  void onNextChanged() {
    printDM('onNextChanged isLastPage-> $isLastPage');
    if (isLastPage) {
      _saveOnBoardingDone(navigate: true);
      Get.offAll(const LoginPage());
    } else {
      pageController.nextPage(
        duration: const Duration(microseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
    update();
  }

  void onSkip() {
    isLastPage = true;
    update();
    _saveOnBoardingDone(navigate: true);
  }

  void onPageChanged(int index) {
    currentIndex = index;
    isLastPage = (index == data.length - 1);
    if (isLastPage) {
      _saveOnBoardingDone();
    }
    update();
  }
}
