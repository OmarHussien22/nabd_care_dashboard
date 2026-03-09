// part of 'imports_pref_storage.dart';

// class PrefStorageImp<T> extends StorageInterface<T> {

//   SharedPreferences ? _pref;
//   SharedPreferences? get pref => _pref;

//   Future<void> _setPref() async {
//     _pref ??= await SharedPreferences.getInstance();
//   }

//   @override
//   Future<void> save(String key, {required T value}) async {
//     await _setPref();
//     switch (T) {
//       case String:
//         _pref?.setString(key, value as String);
//         break;
//       case int:
//         _pref?.setInt(key, value as int);
//         break;
//       case double:
//         _pref?.setDouble(key, value as double);
//         break;
//       case bool:
//         _pref?.setBool(key, value as bool);
//         break;
//       case List:
//         _pref?.setStringList(key, value as List<String>);
//         break;
//       default:
//         throw Exception('Type not supported');
//     }
//   }

//   @override
//   Future<T?> read(String key, {T? defaultValue}) async {
//     await _setPref();
//     return (_pref?.get(key) as T?) ?? defaultValue;
//   }


//   @override
//   // TODO: implement clear
//   void get clear {
//     _setPref().then((value) {
//       _pref?.clear();
//     });
//    }

//   @override
//   void delete(String key) {
//     _setPref().then((value) {
//       _pref?.remove(key);
//     });
//   }



// }