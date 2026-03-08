import 'package:care_desk/src/Core/Services/helper.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
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
          // ── Upload Header ──
          Row(
            children: [
              Icon(Icons.cloud_upload_outlined,
                  size: 20, color: AppColors.get.primary),
              SizedBox(width: 8.toW()),
              CustomText(
                "upload_medical_records",
                fontSize: 14,
                fontWeight: FW.bold,
              ),
            ],
          ),
          SizedBox(height: 12.toH()),
          FileUploadZone(
            onTap: cnt.handelUploadAttachments,
            title: "upload_files",
            subtitle: "click_to_upload_xrays_labs_prescriptions",
          ),
          SizedBox(height: 24.toH()),

          // ── Uploaded Files List ──
          if (cnt.attachments.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "uploaded_files",
                  fontSize: 14,
                  fontWeight: FW.bold,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.toW(), vertical: 2.toH()),
                  decoration: BoxDecoration(
                    color: AppColors.get.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
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
            SizedBox(height: 12.toH()),
            Container(
              decoration: BoxDecoration(
                color: AppColors.get.greyLight.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: AppColors.get.greyLight.withOpacity(0.5)),
              ),
              padding: EdgeInsets.all(8.toW()),
              child: Column(
                children: cnt.attachments.map((attachment) {
                  printDM(
                      "upload file progress ${attachment.progress.toString()}");
                  return GetBuilder<AddPatientBuilder>(
                      id: 'upload_${attachment.id}',
                      builder: (controller) {
                        return FileUploadCard(
                          fileName: attachment.name,
                          fileSize: attachment.size,
                          state: attachment.state,
                          progress: attachment
                              .progress, // Could be dynamic if controller supported it
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
                }).toList(),
              ),
            ),
          ],
        ],
      );
    });
  }
}
