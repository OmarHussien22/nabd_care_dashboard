import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Core/Utils/Validation/app_validator.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/category/core/add_category_params.dart';
import 'package:getx_base_code/src/Features/category/domain/use_cases/add_category_local_use_case.dart';
import 'package:getx_base_code/src/Features/category/presentation/manager/get_category_local_controller.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import 'package:getx_base_code/src/Super/Controllers/Resources/get/get_controller_interface.dart';

class AddCategoryLocalController extends GetControllerInterface {
  late TextEditingController nameArController;
  late TextEditingController nameEnController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final GetCategoryLocalController getCategoryLocalController =
      Get.put(GetCategoryLocalController());
  Future<void> addCategory() async {
    formValidator(
      globalKey: globalKey,
      onSuccessValidate: () async {
        emit(const DataLoading());
        final AddCategoryLocalUseCase useCase = AddCategoryLocalUseCase();
        state = await useCase.call(
            params: AddCategoryParams(
          nameAr: nameArController.text,
          nameEn: nameEnController.text,
        ));
        if (state is DataSuccess) {
          printDM("Category added successfully");
          getCategoryLocalController.fetchLocalCategories();
          Get.back();
          ClientSnacks.successMessage(message: "تم الاضافه بنجاح");
          clearControllers();
          // Get.to(() => GetCategoryPage());
        } else if (state is DataFailed) {
          ClientSnacks.requestError(error: "حدث خطا بسبب ${state.error}");
          printDM("Error adding category: ${state.error}");
        }
        emit(state);
      },
    );
  }

  clearControllers() {
    nameArController.clear();
    nameEnController.clear();
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
    nameArController = TextEditingController();
    nameEnController = TextEditingController();
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
