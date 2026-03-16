import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Constants/Strings/Assets/app_lottie.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Illustrations/Builder/imports_illustration_builder.dart';
import 'package:flutter/material.dart';

class IllustrationEmptyData extends StatelessWidget {
  const IllustrationEmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.defaultScreenALL,
      child: IllustrationPageBuilder(
        title: "no_Data",
        body: "no_data_found",
        imageUrl: AppLottie.emptyData,
      ),
    );
  }
}
