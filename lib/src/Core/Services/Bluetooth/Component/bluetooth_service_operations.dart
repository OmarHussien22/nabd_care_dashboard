// part of 'imports_bluetooth_service.dart';
// class BluetoothServiceOperations {
//   final BluetoothService service ;
//   BluetoothServiceOperations(this.service);
//   //<editor-fold desc="Characteristics">
//   List<BluetoothCharacteristic> get _characteristics => service.characteristics;
//   /// reads from characteristic of the given service
//   List<BluetoothCharacteristic> get characteristics => _characteristics ;
//   /// writes to the given characteristic of the given service ex [0x12 , 0x34]
//   Future<void> writeCharacteristic(BluetoothCharacteristic characteristic, List<int> value) async {
//     await characteristic.write(value);
//   }
//   //</editor-fold>
//   //<editor-fold desc="Descriptors">
//   /// Read from the given descriptor of the given characteristic of the given service
//   Future<List<BluetoothDescriptor>> descriptors(BluetoothCharacteristic characteristic) async {
//     List<BluetoothDescriptor> descriptors = [];
//     try {
//       descriptors = await characteristic.descriptors;
//     } catch (e) {
//       print("Error in getting Bluetooth available descriptors => $e");
//     }
//     return descriptors;
//   }
//   /// writes to the given descriptor of the given characteristic ex [0x12 , 0x34]
//   Future<void> writeDescriptor(BluetoothDescriptor descriptor, List<int> value) async {
//     await descriptor.write(value);
//   }
// //</editor-fold>
//
//   /// Set notifications on the given characteristic of the given service
//   Future<void> onCharacteristicValueChange (BluetoothCharacteristic characteristic,{required Function(List<int>value) onChanged}) async {
//     await characteristic.setNotifyValue(true);
//     characteristic.value.listen((value) {
//       print("Value changed to $value");
//       onChanged(value);
//       // do something with new value
//     });
//   }
// }