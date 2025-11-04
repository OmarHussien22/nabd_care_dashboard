import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Features/LocalAuth/presentation/manager/add_role_controller.dart';

class AddRolePage extends StatelessWidget {
  const AddRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddRoleController());

    return Scaffold(
      body: GetBuilder<AddRoleController>(
        builder: (logic) {
          return Column(
            children: [
              const Text("Add Role"),
              const SizedBox(height: 20),
              TextField(
                controller: logic.nameController,
                decoration: InputDecoration(
                  hintText: "Role Name",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  logic.addRoleUser();
                },
                child: const Text("Add Role"),
              ),
            ],
          );
        },
      ),
    );
  }
}
