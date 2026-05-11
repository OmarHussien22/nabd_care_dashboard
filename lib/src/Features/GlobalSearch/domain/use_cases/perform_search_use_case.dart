import 'package:care_desk/src/Core/network_structure/params/params.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
import '../entities/search_result_entity.dart';
import '../repositories/global_search_repository.dart';

class PerformSearchUseCase extends UseCase<SearchResultEntity, SearchParams> {
  @override
  Future<DataState<SearchResultEntity>>? call({SearchParams? params}) {
    return GlobalSearchRepository.instance.call(params: params);
  }
}

class SearchParams extends Params {
  final String queryStr;

  SearchParams({required this.queryStr});

  @override
  Map<String, dynamic> toJson() => {
        'query': queryStr,
      };

  @override
  Map<String, dynamic> query() => {
        'query': queryStr,
      };
}
