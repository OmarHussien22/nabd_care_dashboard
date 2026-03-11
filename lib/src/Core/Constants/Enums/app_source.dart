import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:flutter/services.dart';

enum AppSource {
  prod,
  dev,
  test,
}

class IntalizeAppSource {
  static AppSource get currentSource => AppSource.prod;

  static void setAppSource() {
    printDM("App Flow${currentSource.toString()}");
  }
}
