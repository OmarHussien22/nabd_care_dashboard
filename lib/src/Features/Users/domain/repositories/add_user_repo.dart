import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import 'package:care_desk/src/Features/Users/domain/entities/user_entity.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';
import '../../data/data_sources/add_user_api_service.dart';
import '../../data/models/user_model.dart';
import '../entities/auth_entities.dart';

class AddUserRepo extends RepoInterface<UserModel> {
  AddUserRepo._();
  static final instance = AddUserRepo._();

  @override
  ServicesInterface get serviceInstance => AddUserApiService.instance;

  @override
  UserModel Function(dynamic data) get onParse => (data) {
        return UserModel.fromJson(data);
      };

  @override
  UserModel? get devData => UserModel(
        id: 3,
        name: 'Mike Ross',
        email: 'mike@gmail.com',
        apiToken: 'token3',
        avatar: 'https://i.pravatar.cc/150?u=3',
        userTypeId: 1,
      );
}
