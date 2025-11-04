import 'package:flutter/material.dart';

import '../../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../../../../../Entities/title_interface.dart';
import '../../../Choice/Resources/single_choice_body.dart';
import '../Components/Body/sheet_body_default.dart';
import '../Components/Headers/Interface/sheet_header_interface.dart';

class SheetSingleSelect<T extends TitleInterface> extends StatelessWidget {
  final String title;
  final SheetHeaderInterface? header;
  final int selectedId;
  final Function(T) onSave;
  final List<T> items;
  final double? height;
  final Widget Function(T item)? builder;

  const SheetSingleSelect(
      {super.key,
      this.title = '',
      this.header,
      required this.onSave,
      required this.items,
      this.selectedId = -1,
      this.builder,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SheetDefaultBody(
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
    );
  }

  
  double get _height {
    var height = items.length * 80.toH();
    var minHeight = 150.toH();
    var maxHeight = 650.toH();
    height = height < minHeight ? minHeight : height;
    height = height > maxHeight ? maxHeight : height;
    return height;
  }
}
