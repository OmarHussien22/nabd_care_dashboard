import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Builders/conditional_builder.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Loading/loading.dart';
import 'package:flutter/material.dart';

class PaginationLoading extends StatelessWidget {
  final bool paginationLoading;
  final bool isDark;
  const PaginationLoading({
    required this.paginationLoading,
    this.isDark = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: paginationLoading,
      onBuild: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.toH()),
        child: Loading.pulse(),
      )),
      onFeedBack: const SizedBox(),
    );
  }
}
