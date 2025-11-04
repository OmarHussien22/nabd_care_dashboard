import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';
import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Core/Utils/Validation/app_validator.dart';
import 'package:getx_base_code/src/Features/sub_category/presentation/manager/add_sub_category_local_controller.dart';
import 'package:getx_base_code/src/Features/sub_category/presentation/widgets/select_category_sheet.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';

class AddSubCategoryDialog {
  void showAddCategoryDialog(BuildContext context) {
    Get.put(AddSubCategoryLocalController());
    var node = FocusScope.of(context);

    Get.defaultDialog(
        title: "add_sub_category",
        backgroundColor: AppColors.get.white,
        content: Container(
          width: MediaQuery.sizeOf(context).width * 0.5,
          height: 450.toH(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GetBuilder<AddSubCategoryLocalController>(
            builder: (logic) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: logic.globalKey,
                  child: Column(
                    children: [
                      AppFillTextFieldField(
                        controller: logic.nameArController,
                        fontSizeHeader: 4,
                        fontSizeHint: 4,
                        hint: "enter_category_name_ar".toTr(),
                        header: "category_name_ar".toTr(),
                        keyboardType: TextInputType.name,
                        validation: AppValidator.defaultValidator.validate,
                        onComplete: () {
                          node.nextFocus();
                        },
                      ),
                      20.ESH(),
                      AppFillTextFieldField(
                        controller: logic.nameEnController,
                        fontSizeHeader: 4,
                        fontSizeHint: 4,
                        hint: "enter_category_name_en".toTr(),
                        header: "category_name_en".toTr(),
                        keyboardType: TextInputType.name,
                        validation: AppValidator.defaultValidator.validate,
                        onComplete: () {
                          node.unfocus();
                          logic.addSubCategory();
                        },
                      ),
                      20.ESH(),
                      SelectCategorySheet(
                        selectId: logic.categoryId,
                        controller: logic.categoryController,
                        onSelected: logic.selectCategory,
                      ),
                      20.ESH(),
                      ButtonDefault(
                        height: 56.toH(),
                        width: double.infinity,
                        isDisabled: logic.isButtonDisabled,
                        title: "sure",
                        onPressed: logic.addSubCategory,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
