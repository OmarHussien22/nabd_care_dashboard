import 'package:care_desk/src/core/network_structure/params/params.dart';

class PaginationParams extends Params {
  final int? page;

  PaginationParams({this.page});
  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page,
    };
  }
}
