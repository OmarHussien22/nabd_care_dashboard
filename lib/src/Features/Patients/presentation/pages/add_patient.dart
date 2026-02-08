import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Inputs/desktop_input.dart';
import 'package:flutter/material.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({super.key});

  @override
  Widget build(BuildContext context) {
    // ضروري جداً استخدام Scaffold هنا ليعمل الـ TextField بشكل صحيح
    return Scaffold(
      backgroundColor: Colors.white, // أو AppColors.get.background
      body: SingleChildScrollView(
        // حل مشكلة الـ Overflow اللي ظهرت في اللوج عندك
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomText("Add New Patient"),
            const SizedBox(height: 20),
            // الـ Inputs الخاصة بك هنا
            DesktopInput(
              hint: "Patient Name",
              label: "Patient Name",
            ),
          ],
        ),
      ),
    );
  }
}
