import 'package:care_desk/src/Shared/Presentation/Widgets/Loading/pagination_loading.dart';
import 'package:flutter/material.dart';

import '../../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../../../../../Entities/title_interface.dart';
import '../../../Choice/Resources/single_choice_body.dart';
import '../Components/Body/sheet_body_default.dart';
import '../Components/Headers/Interface/sheet_header_interface.dart';

class SheetPaginationSingleSelect<T extends TitleInterface>
    extends StatelessWidget {
  final String title;
  final SheetHeaderInterface? header;
  final int selectedId;
  final Function(T) onSave;
  final List<T> items;
  final Widget Function(T item)? builder;
  final bool paginationLoading;

  const SheetPaginationSingleSelect({
    super.key,
    this.title = '',
    this.header,
    required this.onSave,
    required this.items,
    this.selectedId = -1,
    this.builder,
    this.paginationLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height + 50.toH(), // 50 is the height of the pagination loading
      child: Column(
        children: [
          SheetDefaultBody(
            title: title,
            height: _height,
            child: SingleChoiceBody<T>(
              items: items,
              selectedId: selectedId,
              onSave: (value) {
                onSave(value);
              },
              builder: builder,
            ),
          ),
          Expanded(
            child: PaginationLoading(
              paginationLoading: paginationLoading,
            ),
          ),
        ],
      ),
    );
  }

  double get _height {
    var height = items.length * 80.toH();
    var minHeight = 200.toH();
    var maxHeight = 650.toH();
    height = height < minHeight ? minHeight : height;
    height = height > maxHeight ? maxHeight : height;
    return height;
  }
}
