import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Constants/Strings/Assets/app_icons.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Utils/SnackUtils/snack_utils.dart';
import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Entities/title_interface.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Dialogs/app_dialogs.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Sheets/app_Sheet.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Sheets/src/Resources/sheet_single_select.dart';
import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';

import '../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../Core/Utils/Validation/Implementation/DefaultValidator/default_validator.dart';
import '../TextFields/Default/default_text_field.dart';
import 'src/Resources/sheet_multi_select.dart';
import 'src/Resources/sheet_pagination_single_select.dart';

/// general single select sheet
class GeneralSelectSheet<T extends TitleInterface> extends StatelessWidget {
  final String title;
  final int selectedId;
  final String? hintText;
  final String? headerText;
  final List<T> items;
  final Function(T) onSelected;
  final TextEditingController controller;
  final double? headerTextSize;
  final bool needValidate;
  final bool showCondition;
  final bool isPagination;
  final String? failConditionMessage;
  final bool paginationLoading;
  final Function()? fetch;
  const GeneralSelectSheet({
    super.key,
    required this.title,
    this.hintText,
    required this.items,
    required this.onSelected,
    required this.controller,
    this.headerText,
    required this.selectedId,
    this.headerTextSize,
    this.needValidate = true,
    this.showCondition = true,
    this.isPagination = false,
    this.failConditionMessage,
    this.paginationLoading = false,
    this.fetch,
  });

  @override
  Widget build(BuildContext context) {
    var node = FocusNode();

    return GestureDetector(
      onTap: () {
        if (showCondition) {
          if (isPagination) {
            AppSheets.get.showBottomSheet(
              SheetPaginationSingleSelect<T>(
                selectedId: selectedId,
                title: title,
                onSave: (value) {
                  NavigationService.instance.pop();
                  onSelected(value);
                },
                items: items,
                paginationLoading: paginationLoading,
              ),
            );
          } else {
            AppDialogs.showDialog(
              width: 200.toW(),
              // insetPadding: EdgeInsets.symmetric(
              //   horizontal: 55.toW(),
              // ),
              child: SizedBox(
                height: 600.toH(),
                width: 200.toW(),
                child: SheetSingleSelect<T>(
                  selectedId: selectedId,
                  title: title,
                  onSave: (value) {
                    NavigationService.instance.pop();
                    onSelected(value);
                  },
                  items: items,
                ),
              ),
            );
            // AppSheets.get.showBottomSheet(
            //
            // );
          }
        } else {
          AppSnacks().showSnack(
            title:
                failConditionMessage?.toTr() ?? "this_field_is_disabled".toTr(),
            state: UtilState.error,
          );
        }
      },
      child: GestureDetector(
        //  onTap: fetch ?? () {},
        child: TextFieldDefault(
          onTap: () {
            if (fetch != null) {
              fetch!();
            }
          },
          width: 180,
          hint: TFFHint(
            title: hintText?.tr,
            fontSize: 6,
          ),
          header: TFFHeader(
            title: headerText?.tr,
            fontSize: headerTextSize ?? 6,
          ),
          //fillColor: AppColors.get.white,
          suffix: SuffixWithIconData(
            iconData: Icons.keyboard_arrow_down,
            constraintsHeight: 10.toH(),
          ),
          enable: false,
          validation: needValidate ? DefaultValidator.instance.validate : null,
          controller: controller,
          onComplete: () {
            node.nextFocus();
          },
        ),
      ),
    );
  }
}

/// general multi select sheet
///

class GeneralMultiSelectSheet<T extends TitleInterface>
    extends StatelessWidget {
  final String title;
  final List<int> selectedIds;
  final String? hintText;
  final String? headerText;
  final List<T> items;
  final Function(List<T> list) onSelected;
  final TextEditingController controller;
  final double? headerTextSize;

  const GeneralMultiSelectSheet({
    super.key,
    required this.title,
    this.hintText,
    required this.items,
    required this.onSelected,
    required this.controller,
    this.headerText,
    required this.selectedIds,
    this.headerTextSize,
  });

  @override
  Widget build(BuildContext context) {
    var node = FocusNode();

    return GestureDetector(
      onTap: () {
        AppSheets.get.showBottomSheet(
          SheetMultiSelect<T>(
            selectedIds: selectedIds,
            title: title,
            onSave: (value) {
              onSelected(value);
            },
            items: items,
          ),
        );
        // Get.bottomSheet(
        //   SheetSelect(
        //     selectedId: selectedId,
        //     title: title,
        //     onSave: (value) {
        //       Get.back();
        //       onSelected(value);
        //     },
        //     items: items,
        //   ),
        //   isScrollControlled: true,
        // );
      },
      child: TextFieldDefault(
        hint: TFFHint(
          title: hintText?.tr,
        ),
        header: TFFHeader(
          title: headerText?.tr,
          fontSize: headerTextSize,
        ),
        fillColor: AppColors.get.white,
        suffix: SuffixWithIconImage(scale: 1.5, iconImage: AppIcons.downArrow
            //constraintsHeight: 30.toH(),
            ),
        enable: false,
        validation: DefaultValidator.instance.validate,
        controller: controller,
        onComplete: () {
          node.nextFocus();
        },
      ),
    );
  }
}
