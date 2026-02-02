import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Base/presentation/widgets/navigation_side_bar.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/AppBars/app_bars.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Spaces&Dividers/custom_divider.dart';
import '../manager/base_controller.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseController controller = Get.put(BaseController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<BaseController>(
          init: controller,
          builder: (cnt) {
            return Row(
              children: [
                 const NavigationSideBar(),
                //.5.ESW(),
                Expanded(
                  child: Column(
                    children: [
                      // ✅ AppBar ثابت
                        const FixedAppBar(),
                      10.ESH(),
                      XDivider.normal(color: AppColors.get.primary),
                      // ✅ محتوى الصفحة
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.get.activeBackground,

                            // borderRadius: const BorderRadius.all(Radius.circular(12)),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.black12,
                            //     blurRadius: 5,
                            //     offset: Offset(0, 2),
                            //   ),
                            // ],
                          ),
                          child: IndexedStack(
                            index: cnt.selectedMainIndex,
                            children: cnt.pages,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
