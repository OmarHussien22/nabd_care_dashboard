import 'package:care_desk/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Features/LocalAuth/clinic_params.dart';
import 'package:care_desk/src/Features/LocalAuth/domain/repositories/add_clinic_local_repo.dart';
import 'package:care_desk/src/Features/LocalAuth/domain/repositories/register_user_local_repo.dart';
import 'package:care_desk/src/Features/LocalAuth/register_user_params.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';

class RegisterUserLocalUseCase extends UseCase<int, RegisterUserParams> {
  @override
  Future<DataState<int>> call({RegisterUserParams? params}) async {
    final DataState<int> userState =
        await RegisterUserLocalRepo.instance.call(params: params)!;

    if (userState is DataSuccess && userState.data != null) {
      final clinicParams = ClinicParams(
        name: params!.clinicName,
        ownerId: userState.data!,
        createdAt: DateTime.now().toIso8601String(),
      );
      final clinicState =
          await AddClinicLocalRepo.instance.call(params: clinicParams);

      if (clinicState is DataFailed) {
        printDM(
            "Failed to create clinic: ${clinicState?.data ?? 'Unknown error'}");
        // Optional: Rollback logic here if needed
      }
    }
    return userState;
  }
}
