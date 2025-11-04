import '../../domain/entities/onboarding.dart';

class OnBoardingModel extends OnBoarding {
  @override
  final int? id;
  @override
  final String? imageUrl;
  @override
  final String? title;
  @override
  final String? body;

  OnBoardingModel({
    this.id,
    this.imageUrl,
    this.body,
    this.title,
  }) : super(
          id: id,
          imageUrl: imageUrl,
          body: body,
          title: title,
        );

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) {
    return OnBoardingModel(
      id: json['id'] ?? 0,
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}
