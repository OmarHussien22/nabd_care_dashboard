import 'package:care_desk/src/Core/network_structure/params/params.dart';

class PaginationParams extends Params {
  final int? page;

  PaginationParams({this.page});

  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page,
    };
  }

  /// Used by GET requests – sends [page] as a query-string parameter.
  @override
  Map<String, dynamic> query() {
    return {
      if (page != null) 'page': page,
    };
  }
}
