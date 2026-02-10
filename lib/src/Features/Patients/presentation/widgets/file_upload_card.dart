import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

enum FileUploadState { uploading, completed, failed }

class FileUploadCard extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final FileUploadState state;
  final double? progress; // 0.0 to 1.0
  final VoidCallback? onCancel;
  final VoidCallback? onView;
  final VoidCallback? onDownload;
  final VoidCallback? onDelete;
  final String? uploadedBy;
  final DateTime? uploadedDate;
  final bool isImage;

  const FileUploadCard({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.state,
    this.progress,
    this.onCancel,
    this.onView,
    this.onDownload,
    this.onDelete,
    this.uploadedBy,
    this.uploadedDate,
    this.isImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.toH()),
      padding: EdgeInsets.all(12.toW()),
      decoration: BoxDecoration(
        color: state == FileUploadState.uploading
            ? AppColors.get.cardFill.withOpacity(0.5)
            : AppColors.get.white,
        border: Border.all(
          color: state == FileUploadState.uploading
              ? AppColors.get.grey
              : AppColors.get.greyLight,
          style: state == FileUploadState.uploading
              ? BorderStyle.solid
              : BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: state == FileUploadState.completed
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ]
            : null,
      ),
      child: state == FileUploadState.uploading
          ? _buildUploadingState()
          : _buildCompletedState(),
    );
  }

  Widget _buildUploadingState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // File Icon
            Icon(
              isImage ? Icons.image : Icons.picture_as_pdf,
              color: AppColors.get.grey,
              size: 32,
            ),
            SizedBox(width: 12.toW()),
            // File Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fileName,
                    fontSize: 14,
                    fontWeight: FW.semiBold,
                  ),
                  SizedBox(height: 4.toH()),
                  CustomText(
                    fileSize,
                    fontSize: 12,
                    color: AppColors.get.grey,
                  ),
                ],
              ),
            ),
            // Progress Percentage
            CustomText(
              "${((progress ?? 0) * 100).toInt()}%",
              fontSize: 14,
              fontWeight: FW.semiBold,
              color: AppColors.get.primary,
            ),
            SizedBox(width: 8.toW()),
            // Cancel Button
            IconButton(
              onPressed: onCancel,
              icon: Icon(
                Icons.close,
                color: AppColors.get.error,
                size: 20,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        SizedBox(height: 12.toH()),
        // Progress Bar
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress ?? 0,
            backgroundColor: AppColors.get.greyLight,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.get.primary),
            minHeight: 6,
          ),
        ),
      ],
    );
  }

  Widget _buildCompletedState() {
    return Row(
      children: [
        // Thumbnail or Icon
        Container(
          width: 50.toW(),
          height: 50.toH(),
          decoration: BoxDecoration(
            color: AppColors.get.cardFill,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            isImage ? Icons.image : Icons.picture_as_pdf,
            color: AppColors.get.primary,
            size: 28,
          ),
        ),
        SizedBox(width: 12.toW()),
        // File Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                fileName,
                fontSize: 14,
                fontWeight: FW.semiBold,
              ),
              SizedBox(height: 4.toH()),
              CustomText(
                fileSize,
                fontSize: 12,
                color: AppColors.get.grey,
              ),
              if (uploadedBy != null || uploadedDate != null) ...[
                SizedBox(height: 4.toH()),
                CustomText(
                  "${uploadedBy ?? ''} • ${_formatDate(uploadedDate)}",
                  fontSize: 11,
                  color: AppColors.get.grey,
                ),
              ],
            ],
          ),
        ),
        // Action Buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onView != null)
              IconButton(
                onPressed: onView,
                icon: Icon(
                  Icons.visibility_outlined,
                  color: AppColors.get.primary,
                  size: 20,
                ),
                tooltip: "View",
              ),
            if (onDownload != null)
              IconButton(
                onPressed: onDownload,
                icon: Icon(
                  Icons.download_outlined,
                  color: AppColors.get.primary,
                  size: 20,
                ),
                tooltip: "Download",
              ),
            if (onDelete != null)
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColors.get.error,
                  size: 20,
                ),
                tooltip: "Delete",
              ),
          ],
        ),
      ],
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.day}/${date.month}/${date.year}";
  }
}
