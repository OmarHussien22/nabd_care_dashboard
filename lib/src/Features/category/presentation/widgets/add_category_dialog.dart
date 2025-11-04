import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';
import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Core/Utils/Validation/app_validator.dart';
import 'package:getx_base_code/src/Features/category/presentation/manager/add_category_local_controller.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';

class AddCategoryDialog {
  void showAddCategoryDialog(BuildContext context) {
    Get.put(AddCategoryLocalController());
    var node = FocusScope.of(context);

    Get.defaultDialog(
        title: "add_category",
        backgroundColor: AppColors.get.white,
        content: Container(
          width: MediaQuery.sizeOf(context).width * 0.5,
          height: 400.toH(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GetBuilder<AddCategoryLocalController>(
            builder: (logic) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: logic.globalKey,
                  child: Column(
                    children: [
                      AppFillTextFieldField(
                        controller: logic.nameArController,
                        fontSizeHeader: 3,
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
                          logic.addCategory();
                        },
                      ),
                      const SizedBox(height: 20),
                      ButtonDefault(
                        height: 56.toH(),
                        width: double.infinity,
                        isDisabled: logic.isButtonDisabled,
                        title: "sure",
                        onPressed: logic.addCategory,
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
