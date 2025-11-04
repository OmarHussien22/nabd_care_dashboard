class DeviceInfoService {
  DeviceInfoService._();

  static final DeviceInfoService instance = DeviceInfoService._();

  // final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  //
  // /// [getDeviceId] returns the device info
  // Future<String> getDeviceId() async {
  //   String deviceId;
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
  //     printDM(
  //         'Running on ${androidInfo.model} ${androidInfo.id} ${androidInfo.type}'); // e.g. "Moto G (4)"
  //     deviceId = "${androidInfo.model}-${androidInfo.id}-${androidInfo.type}";
  //   } else if (Platform.isIOS) {
  //     IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
  //     deviceId = iosInfo.identifierForVendor.toString();
  //     printDM('Running on ${iosInfo.identifierForVendor}'); // e.g. "iPod7,1"
  //   } else {
  //     deviceId = "Unknown Device Id";
  //   }
  //   return deviceId;
  // }
  //
  // Future<String> get type async {
  //   String deviceType;
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
  //     // deviceType = "${'android'.toTr()} , ${ androidInfo.version.release }";
  //     deviceType = androidInfo.model;
  //   } else if (Platform.isIOS) {
  //     IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
  //     // deviceType = "${'ios'.toTr()} , ${iosInfo.systemVersion}";
  //     deviceType = iosInfo.name ??
  //         iosInfo.systemName ??
  //         iosInfo.model ??
  //         "Unknown Device Type";
  //   } else if (Platform.isWindows) {
  //     deviceType = "${'windows'.toTr()} ,  ${Platform.operatingSystem}";
  //   } else {
  //     deviceType = "Unknown Device Type";
  //   }
  //   return deviceType;
  // }
  //
  // /// Get the AndroidOverscrollIndicator from the device info plugin
  // Future<AndroidOverscrollIndicator> get androidScrollIndicator async {
  //   final androidInfo = await _deviceInfo.androidInfo;
  //   final sdkVersion = androidInfo.version.sdkInt;
  //   final androidOverscrollIndicator = sdkVersion > 30
  //       ? AndroidOverscrollIndicator.stretch
  //       : AndroidOverscrollIndicator.glow;
  //   return androidOverscrollIndicator;
  // }
}
