import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Core/Utils/utils.dart';

extension FromJsonExtension on String {
  String get response {
    final dataA = split(",").join(" \n ");
    final dataB = dataA.split("{").join(" ");
    final dataC = dataB.split("}").join(" ");
    printDM("Dio Service correct request: => $dataC");
    return dataC;
  }
}
