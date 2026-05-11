

import 'package:care_desk/src/Core/Constants/Strings/Assets/app_images.dart';
import 'package:flutter/material.dart';

import 'Builder/imports_illustration_builder.dart';

class IllustrationEmptyData extends StatelessWidget {
  const IllustrationEmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return IllustrationPageBuilder(
      imageUrl: AppImages.empty,
      title: "لا توجد بيانات",
      subtitle: "لا توجد بيانات لعرضها في الوقت الحالي",
    );
  }
}
