import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Super/Controllers/Interface/master_controller.dart';
import 'package:get/get.dart';

abstract class GetControllerInterface<T> extends GetxController
    with MasterController<T> {
  @override
  void emit(DataState<T> value) {
    state = value;
    update();
  }
}
