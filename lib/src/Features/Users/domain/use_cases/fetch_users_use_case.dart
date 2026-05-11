import 'package:care_desk/src/Features/Users/domain/entities/user_entity.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
import '../repositories/users_repository.dart';

class FetchUsersUseCase extends UseCase<List<UserModel>, FetchUsersParams> {
  @override
  Future<DataState<List<UserModel>>>? call({FetchUsersParams? params}) {
    return UsersRepository.instance.call(params: params);
  }
}

class FetchUsersParams extends Params {
  final int page;
  final String? search;

  FetchUsersParams({this.page = 1, this.search});

  @override
  Map<String, dynamic> toJson() => {
        'page': page,
        if (search != null) 'search': search,
      };

  @override
  Map<String, dynamic> query() => toJson();
}
