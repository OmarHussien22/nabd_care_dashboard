import 'package:care_desk/src/Core/Services/helper.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/file_upload_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/file_upload_zone.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/card_view_attachment.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/dialogs/animate_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientAttachmentCard extends StatelessWidget {
  final FocusScopeNode node;
  const AddPatientAttachmentCard({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPatientBuilder>(builder: (cnt) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.toH()),

          // ── Upload Area ──
          Row(
            children: [
              FileUploadZone(
                onTap: cnt.handelUploadAttachments,
                title: "drop_files_here_or_click_to_upload",
                subtitle: "supports_images_pdfs_and_medical_records",
              ),
            ],
          ),
          SizedBox(height: 32.toH()),

          // ── Uploaded Files List ──
          if (cnt.attachments.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                      "uploaded_documents",
                      fontSize: 15,
                      fontWeight: FW.bold,
                    ),
                    SizedBox(width: 8.toW()),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.toW(), vertical: 4.toH()),
                      decoration: BoxDecoration(
                        color: AppColors.get.primary.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomText(
                        "${cnt.attachments.length}",
                        fontSize: 12,
                        fontWeight: FW.bold,
                        color: AppColors.get.primary,
                      ),
                    ),
                  ],
                ),
                if (cnt.attachments
                    .any((a) => a.state == FileUploadState.uploading))
                  CustomText(
                    "uploading_in_progress",
                    fontSize: 12,
                    color: AppColors.get.primary,
                  ),
              ],
            ),
            SizedBox(height: 16.toH()),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: cnt.attachments.length,
              separatorBuilder: (context, index) => SizedBox(height: 4.toH()),
              itemBuilder: (context, index) {
                final attachment = cnt.attachments[index];
                return GetBuilder<AddPatientBuilder>(
                    id: 'upload_${attachment.id}',
                    builder: (controller) {
                      return FileUploadCard(
                        fileName: attachment.name,
                        fileSize: attachment.size,
                        state: attachment.state,
                        progress: attachment.progress,
                        isImage:
                            Helper.mediaSizeHandler.isImage(attachment.name),
                        onCancel: () => cnt.cancelUpload(attachment),
                        onDelete: () => cnt.removeAttachment(attachment),
                        onView: () {
                          Dialogs.animatedDialog(
                            context: context,
                            child: CardViewAttachment(
                              file: attachment.getFile.platformFile!,
                              isImage: Helper.mediaSizeHandler
                                  .isImage(attachment.name),
                            ),
                          );
                        },
                        uploadedDate: DateTime.now(),
                      );
                    });
              },
            ),
          ],

          // ── Empty State ──
          if (cnt.attachments.isEmpty)
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.toH()),
                child: Column(
                  children: [
                    Icon(
                      Icons.note_add_outlined,
                      size: 48,
                      color: AppColors.get.greyLight,
                    ),
                    SizedBox(height: 12.toH()),
                    CustomText(
                      "no_files_uploaded_yet",
                      fontSize: 14,
                      color: AppColors.get.grey,
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
    });
  }
}
