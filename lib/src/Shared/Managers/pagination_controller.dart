import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:flutter/cupertino.dart';

abstract class PaginationController<T> extends GetControllerInterface<T> {
  bool paginationLoading = false;

  late ScrollController scrollController;

  int get fetchCurrentPage {
    if (state.pagination != null) {
      return state.pagination!.current! + 1;
    } else {
      return 1;
    }
  }

  Future<void> setFetchPaginationFunction();

  bool get canLoading {
    if (state.pagination != null) {
      return false;
    } else {
      return true;
    }
  }

  void scrollListen() {
    scrollController.addListener(() async {
      var nextPage = 0.8 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels > nextPage) {
        if (!paginationLoading) {
          if (state.pagination != null) {
            if (state.pagination!.last! > state.pagination!.current!) {
              paginationLoading = true;
              update();
              await setFetchPaginationFunction();
              paginationLoading = false;
              update();
            }
          }
        }
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollListen();
  }

  // TODO: disopse scroll controller
}
