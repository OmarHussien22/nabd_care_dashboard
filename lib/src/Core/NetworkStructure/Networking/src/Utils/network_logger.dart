import 'package:care_desk/src/Core/Utils/general_utils.dart';

class NetworkLogger {
  NetworkLogger._();

  static final instance = NetworkLogger._();

  void logSentBody(Map<String, dynamic> body) => printDM(
      "================= Body Sent Is ==================\n $body \n =======================================================");

  void responseLog(String response) {
  final dataA = response.split(",").join(" \n ");
  final dataB = dataA.split("{").join(" ");
  final dataC = dataB.split("}").join(" ");
  printDM("================= Response From Network is \n $dataC \n ==================");
}

  void errorLog (dynamic error) => printDM(
      "================= Error From NetworkService Is ==================\n $error \n =======================================================");
}
