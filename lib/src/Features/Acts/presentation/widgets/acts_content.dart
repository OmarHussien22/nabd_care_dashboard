import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class ActsContent extends StatefulWidget {
  const ActsContent({super.key});

  @override
  State<ActsContent> createState() => _ActsContentState();
}

class _ActsContentState extends State<ActsContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.toW()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText('Activities', fontSize: 28, fontWeight: FW.bold),
          20.ESH(),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, i) => Container(
                padding: EdgeInsets.all(16.toW()),
                margin: EdgeInsets.only(bottom: 8.toH()),
                decoration: BoxDecoration(
                  color: AppColors.get.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.get.border),
                ),
                child: CustomText('Activity #${1000 + i}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
