import 'dart:async';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../domain/entities/search_result_entity.dart';
import '../../domain/use_cases/perform_search_use_case.dart';

class GlobalSearchController extends GetControllerInterface<SearchResultEntity> {
  final PerformSearchUseCase _performSearchUseCase = PerformSearchUseCase();

  String query = '';
  bool showDropdown = false;
  Timer? _debounce;

  void onSearchChanged(String value) {
    query = value;
    if (value.isEmpty) {
      showDropdown = false;
      _debounce?.cancel();
      emit(DataInitial());
      update(['global_search']);
    } else {
      showDropdown = true;
      _debounceSearch();
    }
  }

  void _debounceSearch() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      performSearch();
    });
  }

  Future<void> performSearch() async {
    if (query.isEmpty) return;

    emit(const DataSearchLoading());
    update(['global_search']);

    final dataState = await _performSearchUseCase.call(
      params: SearchParams(queryStr: query),
    );

    if (dataState != null) {
      emit(dataState);
    }
    update(['global_search']);
  }

  void closeDropdown() {
    showDropdown = false;
    update(['global_search']);
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }
}
