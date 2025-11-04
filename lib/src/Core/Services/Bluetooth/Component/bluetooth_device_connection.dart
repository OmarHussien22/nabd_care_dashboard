// part of 'imports_bluetooth_service.dart';
//
// class BluetoothDeviceConnection {
//   // deviceOperations
//   BluetoothServiceOperations serviceOperation(BluetoothService service) {
//     return BluetoothServiceOperations(service);
//   }
//
//   // connect to device
//   Future<void> connectToDevice(BluetoothDevice device,
//       {Duration? timeout}) async {
//     await device.connect(
//         autoConnect: true, timeout: timeout ?? _connectionTimeout);
//   }
//
//   // disconnect from device
//   Future<void> disconnectFromDevice(BluetoothDevice device) async {
//     await device.disconnect();
//   }
//
//   /// Returns a List of [BluetoothService]s. The list will be empty if the device is not connected.
//   Future<List<BluetoothService>> deviceServices(BluetoothDevice device) async {
//     List<BluetoothService> services = [];
//     try {
//       services = (await device.discoverServices());
//     } catch (e) {
//       print("Error in getting Bluetooth available services => $e");
//     }
//     return services;
//   }
//
//   ///  Read the MTU and request larger size
//   ///  Note [iOS will not allow requests of MTU size, and will always try to negotiate the highest possible MTU (iOS supports up to MTU size 185)]
//   Future<int> readMTU(BluetoothDevice device) async {
//     int mtu = await device.requestMtu(512);
//     return mtu;
//   }
// }
