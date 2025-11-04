import 'package:flutter/material.dart';

import '../../../../../../Core/utils/Extensions/screen_spaces_extension.dart';
import '../../../../../Entities/title_interface.dart';
import '../Components/choice_multi_row.dart';

class MultiChoiceBody<T extends TitleInterface> extends StatelessWidget {
  final List<int> selectedIds;
  final Function(T) onTap;
  final List<T> items;
  final Widget Function(T item)? builder;

  const MultiChoiceBody({super.key, 
    required this.selectedIds,
    required this.onTap,
    required this.items,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.toW()),
          child: ChoiceMultiRow<T>(
            builder: builder != null
                ? builder!(items[index])
                : null,
            active: selectedIds.contains(items[index].id),
            item: items[index],
            onTap: () {
              onTap(items[index]);
              // if (localSelectedIds.contains(items[index].id)) {
              //   localSelectedIds.remove(items[index].id);
              // } else {
              //   localSelectedIds.add(items[index].id);
              // }
            },
          ),
        ),
        separatorBuilder: (context, index) => 24.ESH(),
        itemCount: items.length,
        shrinkWrap: true,
      ),
    );
  }
}
