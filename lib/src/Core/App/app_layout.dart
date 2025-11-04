import 'package:flutter/services.dart';

/// Controls app orientation and status bar
class AppLayout {
  AppLayout._();

  static Future<void> fixedOrientation() {
    List<DeviceOrientation> orientations = [DeviceOrientation.portraitUp];
    return SystemChrome.setPreferredOrientations(orientations);
  }

  static Future<void> setLandscape() {
    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  static Future<void> setOrientationToDefault() {
    List<DeviceOrientation> orientations = [];
    return SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [],
    );
  }

  static Future<void> showStatusBar() => SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
}
