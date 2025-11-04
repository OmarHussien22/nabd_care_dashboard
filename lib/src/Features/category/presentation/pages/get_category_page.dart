import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Features/category/presentation/manager/get_category_local_controller.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/AppBars/app_bars.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class GetCategoryPage extends StatelessWidget {
  const GetCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetCategoryLocalController());
    return Scaffold(
      appBar: AppBars.basic(),
      body: GetBuilder<GetCategoryLocalController>(
        builder: (logic) {
          return Column(
            children: [
              Text('Get Category Page'),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: CustomText("${logic.categories[index].nameAr} "),
                        subtitle: CustomText(logic.categories[index].nameEn),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: logic.categories.length),
              )
            ],
          );
        },
      ),
    );
  }
}
