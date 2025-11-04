import '../../../Core/params/local_params.dart';

class AddProductParams extends LocalParams {
  final int? id;
  final String name;
  final String price;
  final int quantity;
  final int categoryId;

  AddProductParams({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.categoryId,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "quantity": quantity,
      "category_id": categoryId,
      // "is_active": 1, // تأكد أن المنتج مفعل عند الإدخال
    };
  }
}
