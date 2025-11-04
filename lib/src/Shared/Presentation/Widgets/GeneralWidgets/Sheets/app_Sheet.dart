import 'package:getx_base_code/src/Core/Constants/Decorations/app_shapes.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Sheets/src/Components/Headers/Interface/sheet_header_interface.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Sheets/src/Resources/sheet_multi_select.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Sheets/src/Resources/sheet_single_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Core/Libraries/snap/snap.dart';
import '../../../../../Core/Libraries/snap/src/snap_overlay/src/sheet/extension_sheet.dart';
import '../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../Entities/title_interface.dart';

class AppSheets {
  AppSheets._();
  static AppSheets get get => AppSheets._();

  void closeOpenSheets() {
    if (Get.isBottomSheetOpen == true) {
      Get.back();
    }
  }

  void showBottomSheet(
    Widget sheetBody, {
    bool isDismissible = true,
  }) {
    Snap.bottomSheet(
      sheetBody,
      backgroundColor: AppColors.get.main,
      elevation: 2,
      shape: AppShapes.bottomSheetShape,
      isDismissible: isDismissible,
      barrierColor: Colors.black87.withOpacity(0.7),
      enableDrag: true,
      isScrollControlled: true,
    );
  }

  void showSingleSelection<T extends TitleInterface>({
    Key? key,
    String? title,
    SheetHeaderInterface? header,
    int? selectedId,
    required List<T> items,
    required Function(T) onSave,
    double? height,
  }) {
    showBottomSheet(
      SheetSingleSelect<T>(
        key: key,
        items: items,
        onSave: onSave,
        selectedId: selectedId ?? -1,
        height: height ?? 500.toH(),
        title: title ?? '',
        header: header,
      ),
    );
  }

  void showMultiSelection<T extends TitleInterface>({
    Key? key,
    final String? title,
    final SheetHeaderInterface? header,
    final List<int>? selectedIds,
    required final List<T> items,
    required final Function(List<T>) onSave,
    final Widget Function(T item)? builder,
  }) {
    showBottomSheet(
      SheetMultiSelect<T>(
        key: key,
        items: items,
        onSave: onSave,
        selectedIds: selectedIds ?? [],
        title: title ?? '',
        header: header,
      ),
    );
  }

  void showCountrySelection() {}
}
