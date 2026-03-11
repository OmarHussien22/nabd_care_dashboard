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

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: isMobile ? MediaQuery.of(context).size.width * 0.9 : 800.toW(),
          height:
              isMobile ? MediaQuery.of(context).size.height * 0.7 : 600.toH(),
          decoration: BoxDecoration(
            color: AppColors.get.surface,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                // Content
                Positioned.fill(
                  child: isImage
                      ? CardViewImage(file: file)
                      : Center(
                          child: Padding(
                            padding: EdgeInsets.all(32.toW()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(24.toW()),
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.get.primary.withOpacity(0.08),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Helper.mediaIconHandler.getIcon(file.name),
                                    size: 80,
                                    color: AppColors.get.primary,
                                  ),
                                ),
                                SizedBox(height: 24.toH()),
                                CustomText(
                                  file.name,
                                  fontSize: 18,
                                  fontWeight: FW.bold,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  isOverFlow: true,
                                ),
                                SizedBox(height: 8.toH()),
                                CustomText(
                                  Helper.mediaSizeHandler
                                      .formatBytes(file.size),
                                  fontSize: 14,
                                  color: AppColors.get.grey,
                                ),
                                SizedBox(height: 48.toH()),
                                ButtonDefault(
                                  title: Helper.mediaIconHandler
                                      .getButtonTitle(file.name),
                                  onPressed: () async {
                                    await Helper.launcher.openFile(file);
                                  },
                                  backgroundColor: AppColors.get.primary,
                                  titleColor: Colors.white,
                                  height: 54.toH(),
                                  width: 260.toW(),
                                  titleSize: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                ),

                // Close Button
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
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
