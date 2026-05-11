import 'package:care_desk/src/Core/Utils/Extensions/json_parsing_extension.dart';
import '../../domain/entities/search_result_entity.dart';

class SearchResultModel extends SearchResultEntity {
  const SearchResultModel({required super.categories});

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      categories: (json['categories'] as List? ?? [])
          .map((e) => SearchCategoryModel.fromJson(e))
          .toList(),
    );
  }
}

class SearchCategoryModel extends SearchCategoryEntity {
  const SearchCategoryModel({required super.name, required super.items});

  factory SearchCategoryModel.fromJson(Map<String, dynamic> json) {
    return SearchCategoryModel(
      name: json.parseString('name') ?? '',
      items: (json['items'] as List? ?? [])
          .map((e) => SearchItemModel.fromJson(e))
          .toList(),
    );
  }
}

class SearchItemModel extends SearchItemEntity {
  const SearchItemModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.category,
    required super.route,
    super.avatar,
  });

  factory SearchItemModel.fromJson(Map<String, dynamic> json) {
    return SearchItemModel(
      id: json.parseString('id') ?? '',
      title: json.parseString('title') ?? '',
      subtitle: json.parseString('subtitle') ?? '',
      category: json.parseString('category') ?? '',
      route: json.parseString('route') ?? '',
      avatar: json.parseString('avatar'),
    );
  }
}
