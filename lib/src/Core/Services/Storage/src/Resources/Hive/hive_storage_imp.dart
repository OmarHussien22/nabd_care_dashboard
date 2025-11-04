// part of 'imports_hive_storage.dart';
//
// class HiveStorageImp<T> extends StorageInterface<T> {
//   final _hive = Hive;
//
//
//   @override
//   void  init()  {
//     final path = Directory.current.path;
//      _hive.init(path);
//      if (kDebugMode) {
//        print("init success in $path");
//      }
//   }
//   Future<Box> _setBox(String key) async {
//     if (kDebugMode) {
//       print("setBox: $key");
//     }
//     return await _hive.openBox(key);
//   }
//
//   Box _box(String key) {
//     if (_hive.isBoxOpen(key)) {
//       if (kDebugMode) {
//         print("box: $key is Open ");
//       }
//       return _hive.box(key);
//     } else {
//       if (kDebugMode) {
//         print("box: $key is Not Open ");
//       }
//       _setBox(key);
//       return _hive.box(key);
//
//     }
//   }
//
//   @override
//   Future<void> save(String key, {required value}) async =>
//       _box(key).put(key, value);
//
//   @override
//   Future<T?> read(String key, {T? defaultValue}) async {
//     return _box(key).get(key, defaultValue: defaultValue);
//   }
//
//   @override
//   void delete(
//     String key,
//   ) =>
//       _box(key).delete(key);
//
//   @override
//   void get clear => _hive.deleteFromDisk();
//
//   StreamSubscription<BoxEvent> listenKey(String key, ValueSetter callback) {
//     return _box(key).watch(key: key).listen((event) {
//       callback(event);
//     });
//   }
// }
