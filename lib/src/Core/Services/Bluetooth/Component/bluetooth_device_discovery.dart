// part of 'imports_bluetooth_service.dart';
// class BluetoothDeviceDiscovery {
//
//   // package
//   FlutterBluePlus _flutterBlue = FlutterBluePlus.instance;
//
//   //start Scanning
//   Future<void> startScan(
//       {Duration? scanDuration}) async {
//     await _flutterBlue.startScan(
//       timeout: scanDuration ?? _connectionTimeout,
//       allowDuplicates: false,
//       macAddresses: [],
//       scanMode: ScanMode.lowLatency,
//       withDevices: [],
//       withServices: [],
//     );
//   }
//
//
//   /// Returns a broadcast stream of [ScanResult]s. The stream will emit a new event every time a new device is discovered. The stream will end when [stopScan] is called.
//   StreamSubscription<List<ScanResult>> get devicesListener {
//      return _flutterBlue.scanResults.listen((event) {
//       for (ScanResult result in event) {
//         print('${result.device.name} found! rssi: ${result.rssi}');
//       }
//     });
//
//   }
//   //  Stop Scanning
//   Future<void> stopScan() async {
//     await _flutterBlue.stopScan();
//   }
//
// }