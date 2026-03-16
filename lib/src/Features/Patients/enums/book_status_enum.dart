import 'package:flutter/material.dart';

enum BookStatusEnum {
  newBook(1, 'new_book', Colors.green),
  reserved(2, 'reserved', Colors.blue),
  completed(3, 'completed', Colors.green),
  finished(4, 'finished', Colors.green),
  canceled(5, 'canceled', Colors.red);

  final int value;
  final String label;
  final Color color;
  const BookStatusEnum(this.value, this.label, this.color);

  static BookStatusEnum fromValue(int value) {
    return BookStatusEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => BookStatusEnum.newBook,
    );
  }
}
