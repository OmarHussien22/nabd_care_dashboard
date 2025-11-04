abstract class TitleInterface {
  int id;
  String title;
  String? subTitle;
  String? image;
  List<TitleInterface>? children;

  TitleInterface({
    required this.id,
    required this.title,
    this.subTitle,
    this.image,
    this.children,
  });
}
