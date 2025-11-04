import 'package:flutter/foundation.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Features/product/domain/entities/product_entity.dart';
import 'package:getx_base_code/src/Features/product/domain/use_cases/get_products_local_use_case.dart';
import 'package:getx_base_code/src/Super/Controllers/Resources/get/get_controller_interface.dart';

class GetProductLocalController
    extends GetControllerInterface<List<ProductEntity>> {
  List<ProductEntity> products = [];

  Future<void> fetchLocalProducts() async {
    emit(const DataLoading());
    final GetProductsLocalUseCase useCase = GetProductsLocalUseCase();
    state = await useCase.call()!;
    if (state is DataSuccess) {
      if (kDebugMode) {
        print("Success");
      }
      products = state.data!;
    } else if (state is DataFailed) {
      if (kDebugMode) {
        print("Error");
      }
    }
    emit(state);
  }

  @override
  void onInit() {
    //fetchLocalProducts();
    super.onInit();
  }
}
