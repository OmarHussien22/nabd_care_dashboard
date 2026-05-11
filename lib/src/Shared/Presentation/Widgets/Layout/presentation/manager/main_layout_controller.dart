



import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';

class MainLayoutController extends GetControllerInterface{


  bool isCollapsed = false;

  void toggleCollapse() {
    isCollapsed = !isCollapsed;
    printDM("toggleCollapse: $isCollapsed");
    update(["main_layout"]);
  }





}