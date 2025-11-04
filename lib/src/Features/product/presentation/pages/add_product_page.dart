import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Features/product/presentation/manager/add_product_local_controller.dart';
import 'package:getx_base_code/src/Features/product/presentation/manager/get_product_local_controller.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProductLocalController());
    Get.put(GetProductLocalController());

    return Scaffold(
      appBar: AppBar(title: const Text("إضافة منتجات فرعي")),
      body: GetBuilder<AddProductLocalController>(
        builder: (logic) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //spacing: 20,
              children: [
                TextField(
                  controller: logic.nameController,
                  decoration: const InputDecoration(labelText: "اسم المنتج"),
                ),
                20.ESH(),

                TextField(
                  controller: logic.priceController,
                  decoration: const InputDecoration(labelText: "سعر المنتج"),
                ),
                20.ESH(),

                ElevatedButton(
                  onPressed: () {
                    logic.addProduct();
                    // if (logic.subcategoryNameController.text.isNotEmpty &&
                    //     logic
                    //         .subcategoryDescriptionController.text.isNotEmpty) {
                    //   await logic.addCategory();
                    //   print("تمت الإضافة");
                    //   print("تمت الإضافة");
                    // } else {
                    //   print("error");
                    // }
                  },
                  child: const Text("إضافة"),
                ),
                20.ESH(),
                const Text("التصنيفات الفرعية"),
                // Expanded(
                //     child: GetBuilder<GetProductLocalController>(
                //   assignId: true,
                //   builder: (_) {
                //     return ListView.builder(
                //       itemCount: _.state.data?.length,
                //       itemBuilder: (context, index) {
                //         return ListTile(
                //           title: Column(
                //             children: [
                //               Text(_.state.data![index].id.toString() ?? ""),
                //               Text(_.state.data![index].name ?? ""),
                //             ],
                //           ),
                //           subtitle:
                //               Text(_.state.data![index].price.toString() ?? ""),
                //         );
                //       },
                //     );
                //   },
                // )),
              ],
            ),
          );
        },
      ),
    );
  }
}
