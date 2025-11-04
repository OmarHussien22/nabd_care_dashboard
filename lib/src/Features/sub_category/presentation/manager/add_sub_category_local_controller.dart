import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Core/Utils/Validation/app_validator.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/category/data/models/category_model.dart';
import 'package:getx_base_code/src/Features/sub_category/core/add_sub_category_params.dart';
import 'package:getx_base_code/src/Features/sub_category/domain/use_cases/add_sub_category_local_use_case.dart';
import 'package:getx_base_code/src/Features/sub_category/presentation/manager/get_sub_category_local_controller.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import 'package:getx_base_code/src/Super/Controllers/Resources/get/get_controller_interface.dart';

class AddSubCategoryLocalController extends GetControllerInterface {
  late TextEditingController nameArController;
  late TextEditingController nameEnController;
  late TextEditingController categoryController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final GetSubCategoryLocalController getSubCategoryLocalController =
      Get.find<GetSubCategoryLocalController>();

  int _categoryId = 0;
  int get categoryId => _categoryId;

  void selectCategory(CategoryModel category) {
    _categoryId = category.id;
    categoryController.text = category.nameAr;
    printDM("Selected Category ID: $_categoryId");  
    
    update();
  }

  Future<void> addSubCategory() async {
    formValidator(
      globalKey: globalKey,
      onSuccessValidate: () async {
        emit(const DataLoading());
        final AddSubCategoryLocalUseCase useCase = AddSubCategoryLocalUseCase();
        state = await useCase.call(
            params: AddSubCategoryParams(
          categoryId: _categoryId,
          nameAr: nameArController.text,
          nameEn: nameEnController.text,
        ));
        if (state is DataSuccess) {
          printDM("Sub Category added successfully");
          getSubCategoryLocalController.callQuery();
          Get.back();
          clearControllers();
          ClientSnacks.successMessage(message: "تم الاضافه بنجاح");
          // Get.to(() => GetCategoryPage());
        } else if (state is DataFailed) {
          ClientSnacks.requestError(error: "حدث خطا بسبب ${state.error}");
          printDM("Error adding subcategory: ${state.error}");
        }
        emit(state);
      },
    );
  }

  clearControllers() {
    nameArController.clear();
    nameEnController.clear();
    categoryController.clear();
    _categoryId = 0;
    update();
  }

  bool _isButtonDisabled = false;
  bool get isButtonDisabled => _isButtonDisabled;

  void _changeButtonState() {
    if (nameArController.text.isNotEmpty &&
        nameEnController.text.isNotEmpty &&
        categoryController.text.isNotEmpty) {
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
    categoryController = TextEditingController();
    nameEnController.addListener(_changeButtonState);
    nameArController.addListener(_changeButtonState);
    categoryController.addListener(_changeButtonState);
    // descriptionController.addListener(_changeButtonState);
    super.onInit();
  }

  @override
  void onClose() {
    nameArController.dispose();
    nameEnController.dispose();
    categoryController.dispose();
    super.onClose();
  }
}
