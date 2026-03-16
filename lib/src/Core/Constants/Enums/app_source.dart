import 'package:care_desk/src/Core/Utils/general_utils.dart';

enum AppSource {
  prod,
  dev,
  test,
}

class IntalizeAppSource {
  static AppSource get currentSource => AppSource.test;

  static void setAppSource() {
    printDM("App Flow${currentSource.toString()}");
  }
}
