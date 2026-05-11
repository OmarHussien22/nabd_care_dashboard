import 'package:equatable/equatable.dart';

class SearchResultEntity extends Equatable {
  final List<SearchCategoryEntity> categories;

  const SearchResultEntity({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class SearchCategoryEntity extends Equatable {
  final String name;
  final List<SearchItemEntity> items;

  const SearchCategoryEntity({required this.name, required this.items});

  @override
  List<Object?> get props => [name, items];
}

class SearchItemEntity extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String route;
  final String? avatar;

  const SearchItemEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.route,
    this.avatar,
  });

  @override
  List<Object?> get props => [id, title, subtitle, category, route, avatar];
}
