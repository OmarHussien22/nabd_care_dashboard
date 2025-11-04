import 'package:flutter/material.dart';

import '../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../../../../Entities/title_interface.dart';
import '../../Image/generic_image/Src/Parts/imports_parts.dart';
import '../../Image/generic_image/Src/options/image_options.dart';
import '../../Text/custom_text_lib.dart';
import 'choice_single_circle.dart';

class ChoiceSingleRow<T extends TitleInterface> extends StatelessWidget {
  final T item;
  final bool active;
  final double? titleTextSize;
  final double choiceWidth;
  final double choiceHeight;
  final VoidCallback onTap;
  final Widget? builder;
  const ChoiceSingleRow({
    super.key,
    required this.item,
    this.active = false,
    required this.onTap,
    this.titleTextSize = 6,
    this.choiceWidth = 20,
    this.choiceHeight = 20,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //  padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.transparent,
        // decoration: BoxDecoration(
        //   color: Colors.transparent,
        //   border: Border.all(
        //     color: active ? AppColors.get.primary : AppColors.get.grey,
        //     width: 1,
        //   ),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        width: 300,
        child: Row(
          children: [
            if (item.image != null && (item.image ?? '').isNotEmpty) ...[
              ImageNetwork(
                url: item.image ?? '',
                options: const ImageOptions(
                  radius: 30,
                  fit: BoxFit.cover,
                ),
              ),
              8.ESH(),
            ],
            Expanded(
              child: builder ??
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              item.title,
                              color: AppColors.get.black,
                              fontSize: titleTextSize,
                              //fontSize: 16,
                              fontWeight: FW.medium,
                            ),
                          ),
                        ],
                      ),
                      if (item.subTitle != null) ...[
                        8.ESH(),
                        Row(
                          children: [
                            Expanded(
                              child: CustomText(
                                item.subTitle ?? '',
                                color: AppColors.get.grey,
                                fontSize: 4,
                                //fontSize: 13,
                                fontWeight: FW.regular,
                              ),
                            ),
                          ],
                        ),
                      ]
                    ],
                  ),
            ),
            ChoiceSingleCircle(
              isActive: active,
              height: choiceHeight,
              width: choiceWidth,
            ),
          ],
        ),
      ),
    );
  }
}
