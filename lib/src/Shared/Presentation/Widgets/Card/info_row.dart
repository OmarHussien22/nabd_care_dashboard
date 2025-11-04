import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';


class InfoRow extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final double scale;
  final bool isAlwaysLTR;
  const InfoRow({
    super.key,
    required this.icon,
    required this.title,
    this.scale = 20,
    this.subTitle = "",
    this.isAlwaysLTR = false,
  });

  @override
  Widget build(BuildContext context) {
    printDM("title: $title", name: "InfoRow");
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: (scale + 24).toW(),
          width: (scale + 24).toW(),
          alignment: Alignment.center,
          padding: EdgeInsets.all(6.toW()),
          decoration: BoxDecoration(
            color: AppColors.get.lighterGrey,
            shape: BoxShape.circle,
          ),
          child: ImageGeneric.asset(
            url: icon,
            options: ImageOptions(
              width: (scale + 4).toW(),
              height: (scale + 4).toW(),
              color: AppColors.get.primary,
            ),
          ),
        ),
        12.ESW(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  color: AppColors.get.black,
                  fontSize: (scale - 4).toFS(),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subTitle.isEmpty
                  ? const SizedBox.shrink()
                  : CustomText(
                      subTitle,
                      color: AppColors.get.grey,
                      fontSize: (scale - 6).toFS(),
                      maxLines: 1,
                    ),
            ],
          ),
        )
      ],
    );
  }
}
