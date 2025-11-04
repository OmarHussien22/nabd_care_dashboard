
import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../entities/contact_info.dart';
import '../repositries/fetch_contact_info_repository.dart';

class FetchAppInfoUseCase extends UseCase<ContactInfo , void>{
  @override
  Future<DataState<ContactInfo>>? call({void params}) {
    return FetchAppInfoRepository.instance.call();
  }

}