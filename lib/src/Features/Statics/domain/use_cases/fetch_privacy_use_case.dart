

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../repositries/fetch_privacy_repository.dart';

class FetchPrivacyUseCase extends UseCase<String , void>{
  @override
  Future<DataState<String>>? call({void params}) {
    return FetchPrivacyRepository.instance.call();
  }

}