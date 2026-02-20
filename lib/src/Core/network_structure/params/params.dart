abstract class Params {
  dynamic toJson();

  Map<String, dynamic> query() {
    return {};
  }

  bool isCorrect() {
    return true;
  }

  futureToJson() {}
}

class NOParams extends Params {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
