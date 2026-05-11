import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Users/core/add_user_prams.dart';
import 'package:care_desk/src/Features/Users/domain/entities/user_entity.dart';
import 'package:care_desk/src/Features/Users/domain/repositories/add_user_repo.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
import '../repositories/users_repository.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';



class AddUserUseCase extends UseCase<UserModel, AddUserParams> {
  @override
  Future<DataState<UserModel>>? call({AddUserParams? params}) {
    return AddUserRepo.instance.call(params: params);
  }
}
