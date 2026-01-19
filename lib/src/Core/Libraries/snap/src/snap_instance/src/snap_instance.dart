// import 'package:care_desk/src/Core/Utils/general_utils.dart';
// import 'package:care_desk/src/Super/Controllers/Interface/master_controller.dart';
// import 'package:care_desk/src/Super/Controllers/Resources/cubit/cubit_controller_interface.dart';

// class InstanceInfo<T> {
//   final T dependency;
//   final String? tag;
//   final bool permanent;
//   final bool isSingleton;

//   const InstanceInfo({
//     required this.dependency,
//     this.tag,
//     this.permanent = false,
//     this.isSingleton = true,
//   });
// }

// class SnapInstance {
//   static final SnapInstance _singleton = SnapInstance._();
//   factory SnapInstance() => _singleton;
//   SnapInstance._();

//   final Map<String, InstanceInfo> _temporaryStorage = {};

//   T put<T>(
//     T dependency, {
//     String? tag,
//     bool permanent = false,
//     bool isSingleton = true,
//     bool performOnInit = true,
//   }) {
//     final key = _getKey<T>(tag);
//     printDM('SnapInstance put key: $key');
//     if (_temporaryStorage.containsKey(key)) {
//       printDM('SnapInstance put key: $key is already exist');
//       InstanceInfo box = _temporaryStorage[key] as InstanceInfo<T>;
//       if (!box.isSingleton) {
//         _temporaryStorage[key] = InstanceInfo<T>(
//           dependency: dependency,
//           tag: tag,
//           permanent: permanent,
//           isSingleton: isSingleton,
//         );
//         if (T is MasterController) {
//           printDM(
//               'SnapInstance put key: $key is already exist and is MasterController');
//           (dependency as MasterController).onInit();
//         }
//       }
//     } else {
//       printDM('SnapInstance put key: $key is not exist');
//       _temporaryStorage[key] = InstanceInfo<T>(
//         dependency: dependency,
//         tag: tag,
//         permanent: permanent,
//         isSingleton: isSingleton,
//       );
//       // if(T is CubitControllerInterface){
//       printDM(
//           'SnapInstance put key: $key is not exist and is CubitControllerInterface');
//       if (performOnInit) (dependency as CubitControllerInterface).onInit();
//       // }

//     }
//     return get<T>(tag: tag);
//   }

//   remove<T>({String? tag}) {
//     final key = _getKey<T>(tag);
//     if (_temporaryStorage.containsKey(key)) {
//       InstanceInfo box = _temporaryStorage[key] as InstanceInfo<T>;
//       if (box.dependency is CubitControllerInterface) {
//         (box.dependency as CubitControllerInterface).onClose();
//       }
//       _temporaryStorage.remove(key);
//     }
//   }

//   T get<T>({String? tag}) {
//     printDM('SnapInstance get tag: $tag');
//     final key = _getKey<T>(tag);
//     printDM('SnapInstance get key: $key - depend: ${_temporaryStorage[key]}');

//     if (_temporaryStorage.containsKey(key)) {
//       printDM('SnapInstance get key: $key');
//       InstanceInfo box = _temporaryStorage[key] as InstanceInfo<T>;
//       printDM('SnapInstance get key: $key is exist');
//       return box.dependency as T;
//     } else {
//       throw Exception('SnapControllerStorage not found');
//     }
//   }

//   String _getKey<T>(String? tag) {
//     final type = T.toString();
//     return tag == null ? type : '$type-$tag';
//   }
// }
