part of 'imports_fire_store.dart';

abstract class FireStoreStatus<T> {
  T? data;
  bool? status;

  String? message;

  FireStoreStatus({
    this.data,
    this.status,
    this.message,
  });
}

class FireStoreSuccess<T> extends FireStoreStatus<T> {
  FireStoreSuccess({
    super.data,
    super.status,
    super.message,
  });
}

class FireStoreFailed<T> extends FireStoreStatus<T> {
  FireStoreFailed({
    super.data,
    super.status,
    super.message,
  });
}
class FireStoreLoading<T> extends FireStoreStatus<T> {
  FireStoreLoading();
}
