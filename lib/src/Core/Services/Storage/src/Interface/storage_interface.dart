import 'dart:async';


abstract class StorageInterface<T> {
    init(){}
  Future<void> save(String key, {required T value});
  FutureOr<T?> read(String key, {T? defaultValue});
  void delete(String key);
  void get clear;
    // listenKey(String key, ValueSetter callback);
}