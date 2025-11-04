



import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../repositries/fetch_coditions_repository.dart';

class FetchConditionsUSeCase extends UseCase<String , void>{
  @override
  Future<DataState<String>>? call({void params}) {
    return FetchConditionsRepository.instance.call();
  }

}