import 'package:equatable/equatable.dart';

class OnBoarding with EquatableMixin {
  int? id;
  String? imageUrl;
  String? title;
  String? body;

  OnBoarding({
    this.id,
    this.imageUrl,
    this.body,
    this.title,
  });

  @override
  bool? get stringify => true;
  @override
  List<Object?> get props => [id, imageUrl, body, title];
}
