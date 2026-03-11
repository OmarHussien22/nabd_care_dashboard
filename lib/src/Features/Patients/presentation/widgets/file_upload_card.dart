import 'package:care_desk/src/Core/Services/helper.dart';
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(vertical: 6.toH()),
      padding: EdgeInsets.all(14.toW()),
      decoration: BoxDecoration(
        color: state == FileUploadState.uploading
            ? AppColors.get.primary.withOpacity(0.02)
            : AppColors.get.white,
        border: Border.all(
          color: state == FileUploadState.uploading
              ? AppColors.get.primary.withOpacity(0.2)
              : AppColors.get.border.withOpacity(0.6),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: state == FileUploadState.uploading
          ? _buildUploadingState()
          : state == FileUploadState.failed
              ? _buildFailedState()
              : _buildCompletedState(),
    );
  }

  Widget _buildUploadingState() {
    return Column(
      children: [
        Row(
          children: [
            _buildFileIcon(isUploading: true),
            SizedBox(width: 12.toW()),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fileName,
                    fontSize: 14,
                    fontWeight: FW.bold,
                    maxLines: 1,
                    isOverFlow: true,
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
            SizedBox(width: 8.toW()),
            IconButton(
              onPressed: onCancel,
              style: IconButton.styleFrom(
                backgroundColor: AppColors.get.error.withOpacity(0.08),
                padding: EdgeInsets.all(4.toW()),
              ),
              icon: Icon(
                Icons.close,
                color: AppColors.get.error,
                size: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.toH()),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress ?? 0,
                  minHeight: 8,
                  backgroundColor: AppColors.get.primary.withOpacity(0.1),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.get.primary),
                ),
              ),
            ),
            SizedBox(width: 12.toW()),
            CustomText(
              "${((progress ?? 0) * 100).toInt()}%",
              fontSize: 13,
              fontWeight: FW.bold,
              color: AppColors.get.primary,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCompletedState() {
    return Row(
      children: [
        _buildFileIcon(),
        SizedBox(width: 12.toW()),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                fileName,
                fontSize: 14,
                fontWeight: FW.bold,
                maxLines: 1,
                isOverFlow: true,
              ),
              SizedBox(height: 4.toH()),
              Row(
                children: [
                  CustomText(
                    fileSize,
                    fontSize: 12,
                    color: AppColors.get.grey,
                  ),
                  if (uploadedDate != null) ...[
                    CustomText(" • ", color: AppColors.get.grey),
                    CustomText(
                      _formatDate(uploadedDate),
                      fontSize: 12,
                      color: AppColors.get.grey,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onView != null)
              _buildActionButton(Icons.visibility_outlined,
                  AppColors.get.primary, onView!, "View"),
            if (onDownload != null)
              _buildActionButton(Icons.download_rounded, AppColors.get.primary,
                  onDownload!, "Download"),
            if (onDelete != null)
              _buildActionButton(Icons.delete_outline_rounded,
                  AppColors.get.error, onDelete!, "Delete"),
          ],
        ),
      ],
    );
  }

  Widget _buildFileIcon({bool isUploading = false}) {
    return Container(
      width: 44.toW(),
      height: 44.toH(),
      decoration: BoxDecoration(
        color: isUploading
            ? AppColors.get.primary.withOpacity(0.08)
            : AppColors.get.cardFill,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          Helper.mediaIconHandler.getIcon(fileName),
          color: AppColors.get.primary,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, Color color, VoidCallback onPressed, String tooltip) {
    return Padding(
      padding: EdgeInsets.only(left: 4.toW()),
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.all(8.toW()),
            decoration: BoxDecoration(
              color: color.withOpacity(0.06),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFailedState() {
    return Row(
      children: [
        Container(
          width: 44.toW(),
          height: 44.toH(),
          decoration: BoxDecoration(
            color: AppColors.get.error.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.error_outline_rounded, color: AppColors.get.error),
        ),
        SizedBox(width: 12.toW()),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                fileName,
                fontSize: 14,
                fontWeight: FW.bold,
                maxLines: 1,
                isOverFlow: true,
              ),
              CustomText(
                "Upload Failed",
                fontSize: 12,
                color: AppColors.get.error,
              ),
            ],
          ),
        ),
        _buildActionButton(Icons.delete_outline_rounded, AppColors.get.error,
            onDelete!, "Delete"),
      ],
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.day}/${date.month}/${date.year}";
  }
}
