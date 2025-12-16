import 'package:care_desk/src/Shared/Entities/pagination.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';

class PaginationModel extends Pagination {
  PaginationModel({
    super.next,
    super.prev,
    super.total,
    required int super.current,
    super.count,
    required int super.last,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> map) {
    return PaginationModel(
      prev: map['from'] ?? 0,
      count: map['per_page'] ?? 0,
      next: map['to'] ?? 0,
      last: map['last_page'] ?? 0,
      current: map['current_page'] ?? 0,
      total: map['total'] ?? 0,
    );
  }
}
