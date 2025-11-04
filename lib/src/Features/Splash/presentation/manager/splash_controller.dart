import 'package:getx_base_code/src/Core/App/app_flow.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Duration _splashDuration = const Duration(seconds: 2);
  final Curve _animationCurve = Curves.easeInOutBack;

  late AnimationController _controller;
  late Animation _animation;

  Animation get animation => _animation;
  // final StorageService<bool> _box = StorageService<bool>();

  @override
  void onInit() {
    super.onInit();
    // AppData.secureApp();
    _controller = AnimationController(vsync: this, duration: _splashDuration);
    _animation = CurvedAnimation(parent: _controller, curve: _animationCurve);
    _controller.forward();
    _controller.addListener(() {
      update();
      if (_animation.isCompleted) {
        AppFlow.instance.controlFlow();
        printDM("On Boarding isCompleted");
      } else {
        printDM('animation => isDismissed');
      }
    });
  }
}
