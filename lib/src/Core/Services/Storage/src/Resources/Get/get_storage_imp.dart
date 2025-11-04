part of 'imports_get_storage.dart';

class GetStorageImp<T> extends StorageInterface<T> {

  final GetStorage _box = GetStorage();


  @override
  Future init() {
    return GetStorage.init();
  }

  @override
  Future<void> save(String key, {required value}) async =>
      await _box.write(key, value);

  @override
   T? read(String key, {T? defaultValue})  {
    return _box.read(key)?? defaultValue;
  }

  @override
  void delete(String key,) => _box.remove(key);

  @override
  void get clear => _box.erase();

  VoidCallback listenKey(String key, ValueSetter callback){
   return _box.listenKey(key,callback);
  }

  /// add listener to a container
   VoidCallback listen( VoidCallback value) {
    return _box.listen( value);
  }






}