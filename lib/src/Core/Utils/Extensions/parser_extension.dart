
// import '../general_utils.dart';

// void _logData(
//   String title, {
//   String name = '',
// }) {
//   printDM(title, name: name);
// }

// final Map<dynamic, dynamic> _defaultValues = {
//   String: "",
//   int: -1,
//   double: 0.0,
//   bool: false,
//   Map: <String, dynamic>{},
// };

// extension SafeParserExtension on Map<String, dynamic> {
//   T parse<T>(
//     String key, {
//     T? defaultValue,
//     String name = '',
//   }) {
//     final value = this[key];
//     if (value is T) {
//       _logData("$key key => $value", name: name);
//       return value;
//     } else if (defaultValue != null) {
//       _logData("$key (default key) => $defaultValue", name: name);
//       return defaultValue;
//     } else if (_defaultValues.containsKey(T)) {
//       final defaultValue = _defaultValues[T] as T;
//       _logData("$key (default key) => $defaultValue", name: name);
//       return defaultValue;
//     } else {
//       _logData("No default value for type $T found, please provide one",
//           name: name);
//       return null as T;
//     }
//   }
// }

// extension LoggerExtension on Object? {
//   // void logLast({String name = ''}) =>
//   //     printDM("--------------------------------------------------", name: name);
//   //
//   // void logFirst({String name = ''}) =>
//   //     printDM("******************** $name *********************", name: name);

//   void log({String name = ''}) => printDM(toString(), name: name);
// }
