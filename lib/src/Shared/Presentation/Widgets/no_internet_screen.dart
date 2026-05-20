import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Managers/check_network_controller.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckNetworkController>();

    return Scaffold(
      backgroundColor: AppColors.get.background,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.toW()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Animated/Styled Connection Icon
              Container(
                width: 140.toW(),
                height: 140.toW(),
                decoration: BoxDecoration(
                  color: AppColors.get.error.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 100.toW(),
                    height: 100.toW(),
                    decoration: BoxDecoration(
                      color: AppColors.get.error.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.wifi_off_rounded,
                      size: 48.toRad(),
                      color: AppColors.get.error,
                    ),
                  ),
                ),
              ),
              40.ESH(),
              // Title
              CustomText(
                'illustration_no_connection'.tr,
                fontSize: 22,
                fontWeight: FW.bold,
                color: AppColors.get.textPrimary,
                textAlign: TextAlign.center,
              ),
              12.ESH(),
              // Description
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400.toW()),
                child: CustomText(
                  'internet_connection_problem'.tr,
                  fontSize: 14,
                  fontWeight: FW.regular,
                  color: AppColors.get.textSecondary,
                  textAlign: TextAlign.center,
                ),
              ),
              48.ESH(),
              // Action Button
              Obx(() {
                final isChecking = controller.isChecking.value;
                return SizedBox(
                  width: 220.toW(),
                  height: 52.toH(),
                  child: ElevatedButton(
                    onPressed: isChecking
                        ? null
                        : () async {
                            final reconnected = await controller.forceRecheck();
                            if (reconnected) {
                              Get.snackbar(
                                'connected'.tr,
                                'internet_restored'.tr,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                margin: EdgeInsets.all(16.toRad()),
                                duration: const Duration(seconds: 2),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.get.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.toRad()),
                      ),
                      shadowColor: AppColors.get.primary.withOpacity(0.3),
                    ),
                    child: isChecking
                        ? SizedBox(
                            width: 24.toW(),
                            height: 24.toW(),
                            child: const CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.refresh_rounded, size: 20.toRad()),
                              8.ESW(),
                              CustomText(
                                'try_again'.tr,
                                color: Colors.white,
                                fontWeight: FW.bold,
                                fontSize: 15,
                              ),
                            ],
                          ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
