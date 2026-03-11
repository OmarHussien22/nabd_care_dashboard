import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:dashed_border/dashed_border.dart';
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
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.toH(), horizontal: 24.toW()),
        decoration: BoxDecoration(
          color: AppColors.get.primary.withOpacity(0.01),
          borderRadius: BorderRadius.circular(16),
          border: DashedBorder(
            color: AppColors.get.primary.withOpacity(0.4),
            width: 2,
            dashLength: 8.0,
            dashGap: 6.0,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.toW()),
              decoration: BoxDecoration(
                color: AppColors.get.primary.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 42,
                color: AppColors.get.primary,
              ),
            ),
            SizedBox(height: 20.toH()),
            CustomText(
              title,
              fontSize: 18,
              fontWeight: FW.bold,
              color: AppColors.get.textPrimary,
            ),
            SizedBox(height: 8.toH()),
            CustomText(
              subtitle,
              fontSize: 14,
              color: AppColors.get.grey,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.toH()),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 8.toH()),
              decoration: BoxDecoration(
                color: AppColors.get.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: CustomText(
                "browse_files",
                color: AppColors.get.white,
                fontSize: 14,
                fontWeight: FW.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
