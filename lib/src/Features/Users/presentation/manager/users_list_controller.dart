import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Users/domain/entities/user_entity.dart';
import 'package:care_desk/src/Features/Users/domain/use_cases/fetch_users_use_case.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../data/models/user_model.dart';

class UsersListController extends GetControllerInterface<List<UserModel>> {
  final FetchUsersUseCase _fetchUsersUseCase = FetchUsersUseCase();

  int currentPage = 1;
  String? searchQuery;
  List<UserModel> users = [];

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers({bool refresh = false}) async {
    if (refresh) {
      currentPage = 1;
      users.clear();
    }

    emit(const DataLoading());
    
    final dataState = await _fetchUsersUseCase.call(
      params: FetchUsersParams(page: currentPage, search: searchQuery),
    );

    if (dataState is DataSuccess) {
      if (refresh) {
        users = dataState!.data ?? [];
      } else {
        users.addAll(dataState!.data ?? []);
      }
      emit(dataState);
    } else if (dataState is DataFailed) {
      emit(dataState!);
    }
    
    update(['users_list']);
  }

  void onSearch(String query) {
    searchQuery = query;
    fetchUsers(refresh: true);
  }
}
