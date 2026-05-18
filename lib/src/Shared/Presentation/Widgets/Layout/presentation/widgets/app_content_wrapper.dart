import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class AppContentWrapper extends StatelessWidget {
  final Widget child;
  final bool scrollable;
  final EdgeInsets? padding;
  final String? title;
  final Widget? breadcrumb;
  final List<Widget>? actions;

  const AppContentWrapper({
    super.key,
    required this.child,
    this.scrollable = true,
    this.padding,
    this.title,
    this.breadcrumb,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          if (title != null ||
              breadcrumb != null ||
              (actions?.isNotEmpty ?? false))
            _buildHeader(context),
          Expanded(
            child: scrollable
                ? SingleChildScrollView(
                    padding: padding ?? EdgeInsets.all(24.toRad()),
                    child: child,
                  )
                : Padding(
                    padding: padding ?? EdgeInsets.all(24.toRad()),
                    child: child,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.toW(), vertical: 20.toH()),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (breadcrumb != null) breadcrumb!,
                if (title != null) ...[
                  8.ESH(),
                  CustomText(
                    title ?? "",
                    fontSize: 14,
                    fontWeight: FW.bold,
                  ),
                ],
              ],
            ),
          ),
          if (actions != null) ...[
            20.ESW(),
            ...actions!,
          ],
        ],
      ),
    );
  }
}
