import 'package:care_desk/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:flutter/material.dart';

mixin MasterController<T> {
  void emit(DataState<T> value);

  DataState<T> state = DataInitial<T>();

  bool get stateReady => state is! DataLoading;

  bool get stateUnReady => state is DataLoading;

  bool get stateSuccess => state is DataSuccess;

  bool get stateNotSuccess => state is! DataSuccess;

  bool get stateError => state is DataFailed;

  @mustCallSuper
  void onInit() {}

  void onClose() {}

  /// Use onClose() instead
}
