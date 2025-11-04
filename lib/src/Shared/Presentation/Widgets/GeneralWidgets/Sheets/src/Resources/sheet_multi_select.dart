import 'package:flutter/material.dart';

import '../../../../../../../Core/Libraries/snap/snap.dart';
import '../../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../../../../../Entities/title_interface.dart';
import '../../../Buttons/Basic/custom_rounded_button.dart';
import '../../../Choice/Resources/multi_choice_body.dart';
import '../Components/Body/sheet_body_default.dart';
import '../Components/Headers/Interface/sheet_header_interface.dart';

class SheetMultiSelect<T extends TitleInterface> extends StatefulWidget {
  final String title;
  final SheetHeaderInterface? header;
  final List<int>? selectedIds;
  final Function(List<T>) onSave;
  final List<T> items;
  final double height;
  final Widget Function(T item)? builder;
  const SheetMultiSelect({
    super.key,
    this.title = '',
    this.header,
    required this.onSave,
    required this.items,
    this.height = 500,
    this.selectedIds,
    this.builder,
  });

  @override
  State<SheetMultiSelect<T>> createState() => _SheetMultiSelectState<T>();
}

class _SheetMultiSelectState<T extends TitleInterface> extends State<SheetMultiSelect<T>> {
  List<T> selectedItems = [];
  List<int> localSelectedIds = [];

  @override
  void initState() {
    super.initState();
    if (widget.selectedIds != null) {
      localSelectedIds.addAll(widget.selectedIds!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SheetDefaultBody(
        title: widget.title,
        height: widget.height.toH(),
        footer: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 16.toH()),
          child: ButtonDefault(
            title: 'save',
            color: AppColors.get.primary,
            // buttonColor: AppColors.get.primary,
            titleSize: 18,
            onPressed: () {
              selectedItems = [];
              for (var element in widget.items) {
                if (localSelectedIds.contains(element.id)) {
                  selectedItems.add(element);
                }
              }
              widget.onSave(selectedItems);
              Snap.back();
            },
          ),
        ),
        child: MultiChoiceBody<T>(
          items: widget.items,
          selectedIds: localSelectedIds,
          onTap: (value) {
            setState(() {
              if (localSelectedIds.contains(value.id)) {
                localSelectedIds.remove(value.id);
              } else {
                localSelectedIds.add(value.id);
              }
            });
          },
          builder: widget.builder,
        ));
  }
}
