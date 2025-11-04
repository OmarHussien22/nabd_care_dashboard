
import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../entities/question.dart';
import '../repositries/fetch_faq_repository.dart';

class FetchFaqUseCase extends UseCase<List<Question> , void>{
  @override
  Future<DataState<List<Question>>>? call({void params}) {
    return FetchFaqRepository.instance.call();
  }

}