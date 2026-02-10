import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class FileUploadZone extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final IconData icon;

  const FileUploadZone({
    super.key,
    required this.onTap,
    this.title = "Upload Files",
    this.subtitle = "Click to browse or drag and drop",
    this.icon = Icons.cloud_upload_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 32.toH(), horizontal: 16.toW()),
        decoration: BoxDecoration(
          color: AppColors.get.cardFill.withOpacity(0.3),
          border: Border.all(
            color: AppColors.get.grey,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: AppColors.get.primary,
            ),
            SizedBox(height: 12.toH()),
            CustomText(
              title,
              fontSize: 16,
              fontWeight: FW.semiBold,
              color: AppColors.get.textPrimary,
            ),
            SizedBox(height: 4.toH()),
            CustomText(
              subtitle,
              fontSize: 13,
              color: AppColors.get.grey,
            ),
          ],
        ),
      ),
    );
  }
}
