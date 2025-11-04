import 'package:getx_base_code/src/Core/NetworkStructure/Params/params.dart';

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
