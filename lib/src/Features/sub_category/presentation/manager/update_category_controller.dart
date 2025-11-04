import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Core/Utils/Validation/app_validator.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/category/core/update_category_params.dart';
import 'package:getx_base_code/src/Features/category/data/models/category_model.dart';
import 'package:getx_base_code/src/Features/category/domain/use_cases/update_category_local_use_case.dart';
import 'package:getx_base_code/src/Features/category/presentation/manager/get_category_local_controller.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import 'package:getx_base_code/src/Super/Controllers/Resources/get/get_controller_interface.dart';

class UpdateCategoryController extends GetControllerInterface {
  final CategoryModel categoryModel;
  UpdateCategoryController({required this.categoryModel});
  late TextEditingController nameArController;
  late TextEditingController nameEnController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final GetCategoryLocalController getCategoryLocalController =
      Get.find<GetCategoryLocalController>();
  Future<void> updateCategory() async {
    formValidator(
      globalKey: globalKey,
      onSuccessValidate: () async {
        emit(const DataLoading());
        final UpdateCategoryLocalUseCase useCase = UpdateCategoryLocalUseCase();
        state = await useCase.call(
            params: UpdateCategoryParams(
          id: categoryModel.id,
          nameAr: nameArController.text,
          nameEn: nameEnController.text,
          // description: descriptionController.text,
        ));
        if (state is DataSuccess) {
          printDM("Category Update successfully");
          getCategoryLocalController.fetchLocalCategories();
          Get.back();
          ClientSnacks.successMessage(message: "تم التعديل بنجاح");
          // Get.to(() => GetCategoryPage());
        } else if (state is DataFailed) {
          ClientSnacks.requestError(error: "حدث خطا بسبب ${state.error}");
          printDM("Error adding category: ${state.error}");
        }
        emit(state);
      },
    );
  }

  bool _isButtonDisabled = false;
  bool get isButtonDisabled => _isButtonDisabled;

  void _changeButtonState() {
    if (nameArController.text.isNotEmpty && nameEnController.text.isNotEmpty) {
      _isButtonDisabled = false;
    } else {
      _isButtonDisabled = true;
    }
    update();
  }

  @override
  void onInit() {
    nameArController = TextEditingController(text: categoryModel.nameAr);
    nameEnController = TextEditingController(text: categoryModel.nameEn);
    nameEnController.addListener(_changeButtonState);
    nameArController.addListener(_changeButtonState);
    // descriptionController.addListener(_changeButtonState);
    super.onInit();
  }

  @override
  void onClose() {
    nameArController.dispose();
    nameEnController.dispose();
    super.onClose();
  }
}
