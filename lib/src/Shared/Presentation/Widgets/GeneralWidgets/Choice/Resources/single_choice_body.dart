import 'package:flutter/material.dart';

import '../../../../../../Core/utils/Extensions/screen_spaces_extension.dart';
import '../../../../../Entities/title_interface.dart';
import '../Components/choice_single_row.dart';

class SingleChoiceBody<T extends TitleInterface> extends StatelessWidget {
  final int selectedId;
  final Function(T) onSave;
  final List<T> items;
  final Widget Function(T item)? builder;
  const SingleChoiceBody({
    super.key,
    required this.selectedId,
    required this.onSave,
    required this.items,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.toW()),
          child: ChoiceSingleRow<T>(
            builder: builder != null ? builder!(items[index]) : null,
            active: selectedId == items[index].id,
            item: items[index],
            onTap: () {
              onSave(items[index]);

            },
          )),
      separatorBuilder: (context, index) => 16.ESH(),
      itemCount: items.length,
    );
  }
}
