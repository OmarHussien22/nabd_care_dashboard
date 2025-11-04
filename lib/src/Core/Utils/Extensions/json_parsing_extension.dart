import '../general_utils.dart';

extension JsonParsingExtension on Map<String, dynamic>? {
  String parseString(String key, {String defaultValue = ''}) {
    final value = this?[key];
    if (value == null) {
      printDM("key: $key is null", name: "jsonParsingExtension");
      return defaultValue;
    } else if (value is! String) {
      if (value is int || value is double || value is bool) {
        return value.toString();
      }
      printDM(
        "key: $key is not a string, It's ${value.runtimeType}",
        name: "jsonParsingExtension",
      );

      return defaultValue;
    } else {
      return value;
    }
  }

  int parseInt(String key, {int defaultValue = 0}) {
    final value = this?[key];
    if (value == null) {
      printDM("key: $key is null", name: "jsonParsingExtension");
      return defaultValue;
    } else if (value is! int) {
      if (value is double) {
        return value.toInt();
      } else if (value is String) {
        return int.tryParse(value) ?? defaultValue;
      }
      printDM(
        "key: $key is not an int, It's ${value.runtimeType}",
        name: "jsonParsingExtension",
      );

      return defaultValue;
    } else {
      return value;
    }
  }

  double parseDouble(String key, {double defaultValue = 0.0}) {
    final value = this?[key];
    if (value == null) {
      printDM("key: $key is null", name: "jsonParsingExtension");
      return defaultValue;
    } else if (value is! double) {
      if (value is int) {
        return value.toDouble();
      } else if (value is String) {
        return double.tryParse(value) ?? defaultValue;
      }
      printDM(
        "key: $key is not a double, It's ${value.runtimeType}",
        name: "jsonParsingExtension",
      );

      return defaultValue;
    } else {
      return value;
    }
  }

  bool parseBool(String key, {bool defaultValue = false}) {
    final value = this?[key];
    if (value == null) {
      printDM("key: $key is null", name: "jsonParsingExtension");
      return defaultValue;
    } else if (value is! bool) {
      if (value is int || value is double) {
        return value == 1 || value == 1.0;
      }
      printDM(
        "key: $key is not a bool, It's ${value.runtimeType}",
        name: "jsonParsingExtension",
      );

      return defaultValue;
    } else {
      return value;
    }
  }

  List<T> parseList<T>(
    String key,
    T Function(Map<String, dynamic> e) onParse, {
    List<T> defaultValue = const [],
  }) {
    final value = this?[key];
    if (value == null) {
      printDM("key: $key is null", name: "jsonParsingExtension");
      return defaultValue;
    } else if (value is! List) {
      printDM(
        "key: $key is not a list, It's a list of ${value.runtimeType}",
        name: "jsonParsingExtension",
      );
      return defaultValue;
    } else if (value.isNotEmpty && value.first is! Map<String, dynamic>) {
      printDM(
        "key: $key is not a list of maps, It's a list of ${value.first.runtimeType}",
        name: "jsonParsingExtension",
      );
      return defaultValue;
    } else {
      return value.map((e) => onParse(e)).toList();
    }
  }

  T? parseObj<T>(String key, T Function(Map<String, dynamic> e) onParse,
      {T? defaultValue, String hintTitle = ''}) {
    final value = this?[key];
    if (value == null) {
      printDM("The key: $key is null", name: "jsonParsingExtension");
      return defaultValue;
    } else if (value is! Map<String, dynamic>) {
      printDM(
        "The key: $key is not a map, It's ${value.runtimeType}",
        name: "jsonParsingExtension",
      );
      return defaultValue;
    } else {
      return onParse(value);
    }
  }
}
