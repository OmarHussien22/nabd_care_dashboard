abstract class Params {
  Map<String, dynamic> toJson();
  Map<String, dynamic> query() {
    return {};
  }

  futureToJson() {}
}
