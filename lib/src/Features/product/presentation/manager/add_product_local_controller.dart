import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Features/category/presentation/pages/get_category_page.dart';
import 'package:getx_base_code/src/Features/product/core/add_product_params.dart';
import 'package:getx_base_code/src/Super/Controllers/Resources/get/get_controller_interface.dart';

import '../../domain/use_cases/add_product_local_use_case.dart';

class AddProductLocalController extends GetControllerInterface {
  late TextEditingController nameController;
  late TextEditingController priceController;
  // late TextEditingController quantityController;
  // late TextEditingController categoryIdController;
  Future<void> addProduct() async {
    emit(const DataLoading());
    final AddProductLocalUseCase useCase = AddProductLocalUseCase();
    state = await useCase.call(
        params: AddProductParams(
      name: nameController.text,
      price: priceController.text,
      quantity: 1,
      categoryId: 1,
    ));
    if (state is DataSuccess) {
      if (kDebugMode) {
        print("Product added successfully");
      }
      Get.to(() => GetCategoryPage());
    } else if (state is DataFailed) {
      if (kDebugMode) {
        print("Error adding product: ${state.error}");
      }
    }
    emit(state);
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    super.onInit();
  }
}
