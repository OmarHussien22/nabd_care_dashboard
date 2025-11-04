import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../entities/contact_info.dart';
import '../repositries/fetch_about_repository.dart';

class FetchAboutUseCase extends UseCase<ContactInfo, void> {
  @override
  Future<DataState<ContactInfo>>? call({void params}) {
    return FetchAboutRepository.instance.call();
  }
}
