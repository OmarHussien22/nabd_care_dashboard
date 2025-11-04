import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Super/Controllers/Interface/master_controller.dart';
import 'package:flutter/material.dart';

abstract class RiverControllerInterface<T> extends ChangeNotifier
    with MasterController<T> {
  @override
  void emit(DataState<T> value) {
    state = value;
    notifyListeners();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
