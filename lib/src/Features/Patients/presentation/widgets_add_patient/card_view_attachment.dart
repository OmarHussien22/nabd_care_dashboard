import 'package:care_desk/src/Core/Services/helper.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/card_view_image.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CardViewAttachment extends StatelessWidget {
  final PlatformFile file;
  final bool isImage;
  const CardViewAttachment(
      {super.key, required this.file, required this.isImage});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    // final String extension = file.name.split('.').last.toLowerCase();
    // final bool isImage =
    //     ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(extension);
    // final bool isPdf = extension == 'pdf';

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: isMobile ? MediaQuery.of(context).size.width * 0.9 : 800.toW(),
          height:
              isMobile ? MediaQuery.of(context).size.height * 0.7 : 800.toH(),
          decoration: BoxDecoration(
            color: AppColors.get.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Content
                Positioned.fill(
                  child: isImage
                      ? CardViewImage(file: file)
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.insert_drive_file,
                                size: 80,
                                color: AppColors.get.primary,
                              ),
                              SizedBox(height: 24.toH()),
                              CustomText(
                                file.name,
                                fontSize: 16,
                                fontWeight: FW.semiBold,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 32.toH()),
                              ButtonDefault(
                                title: "open_document",
                                onPressed: () async {
                                  await Helper.launcher.openPdfWeb(file);
                                },
                                backgroundColor: AppColors.get.primary,
                                titleColor: Colors.white,
                                height: 50.toH(),
                                width: 200.toW(),
                                titleSize: 16,
                              ),
                            ],
                          ),
                        ),
                ),

                // Close Button
                Positioned(
                  top: 12,
                  right: 12,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.get.surfaceContainer.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: AppColors.get.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
