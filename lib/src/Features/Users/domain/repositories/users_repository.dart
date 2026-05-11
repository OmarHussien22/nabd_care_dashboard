import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import 'package:care_desk/src/Features/Users/domain/entities/user_entity.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';
import '../../data/data_sources/users_api_service.dart';
import '../../data/models/user_model.dart';
import '../entities/auth_entities.dart';

class UsersRepository extends RepoInterface<List<UserModel>> {
  UsersRepository._();
  static final instance = UsersRepository._();

  @override
  ServicesInterface get serviceInstance => UsersApiService.instance;

  @override
  List<UserModel> Function(dynamic data) get onParse => (data) {
        return (data as List? ?? [])
            .map((e) => UserModel.fromJson(e))
            .toList();
      };

  @override
  List<UserModel>? get devData => [
        UserModel.devUser,
        UserModel(
          id: 2,
          name: 'Sarah Smith',
          email: 'sarah@gmail.com',
          apiToken: 'token2',
          avatar: 'https://i.pravatar.cc/150?u=2',
          userTypeId: 1,
        ),
        UserModel(
          id: 3,
          name: 'Mike Ross',
          email: 'mike@gmail.com',
          apiToken: 'token3',
          avatar: 'https://i.pravatar.cc/150?u=3',
          userTypeId: 1,
        ),
      ];
}
