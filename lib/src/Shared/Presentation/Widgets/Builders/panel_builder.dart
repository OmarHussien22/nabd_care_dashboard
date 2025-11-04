import 'package:getx_base_code/src/Core/Constants/decorations/app_physics.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/Builders/conditional_builder.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/Builders/row_show_all_builder.dart';
import 'package:flutter/material.dart';

typedef PanelItemBuilder<T> = Widget Function(BuildContext context, T element);

enum PanelDisplayType {
  list,
  slider,
  grid,
  none,
}

class PanelBuilder<T> extends StatelessWidget {
  final PanelDisplayType type;
  final String title;
  final List<T> list;
  final PanelItemBuilder<T> builder;
  final Widget? customChild;
  final PanelOptions options;

  final VoidCallback? onTap;

  const PanelBuilder({
    super.key,
    required this.title,
    required this.list,
    required this.builder,
    this.type = PanelDisplayType.none,
    this.customChild,
    this.options = const PanelOptions(),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.isNotEmpty,
      onBuild: Container(
        padding: options.padding,
        margin: options.margin,
        child: Column(
          children: [
            RowShowAll(
              title: title,
              onTap: onTap,
              hasSpacing: true,
            ),
            Builder(
              builder: (context) {
                switch (type) {
                  case PanelDisplayType.list:
                    return AnimatedWrapper(
                      index: list.length,
                      child: ListView.separated(
                        physics: options.isShrink
                            ? AppPhysics.neverScrollable
                            : AppPhysics.alwaysScrollablePhysics,
                        shrinkWrap: options.isShrink,
                        itemBuilder: (context, index) {
                          final element = list[index];
                          return builder(context, element);
                        },
                        separatorBuilder: (context, index) =>
                            options.spacer.ESH(),
                        itemCount: list.length,
                      ),
                    );
                  case PanelDisplayType.slider:
                    return AnimatedWrapper(
                      index: list.length,
                      child: _PanelWrapper(
                        isExpanded: options.isExpanded,
                        child: SizedBox(
                          height:
                              options.isExpanded ? null : options.height.toH(),
                          child: ListView.separated(
                            controller: options.scrollController,
                            physics: options.isShrink
                                ? AppPhysics.neverScrollable
                                : AppPhysics.alwaysScrollablePhysics,
                            shrinkWrap: options.isShrink,
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            separatorBuilder: (context, index) =>
                                options.spacer.ESW(),
                            itemBuilder: (context, index) {
                              final element = list[index];
                              return builder(context, element);
                            },
                          ),
                        ),
                      ),
                    );

                  case PanelDisplayType.grid:
                    return AnimatedWrapper(
                      index: list.length,
                      child: _PanelWrapper(
                        isExpanded: options.isExpanded,
                        child: SizedBox(
                          height:
                              options.isExpanded ? null : options.height.toH(),
                          child: GridView.builder(
                            controller: options.scrollController,
                            physics: options.isShrink
                                ? AppPhysics.neverScrollable
                                : AppPhysics.alwaysScrollablePhysics,
                            shrinkWrap: options.isShrink,
                            itemCount: list.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: list.length,
                            ),
                            itemBuilder: (context, index) {
                              final element = list[index];
                              return builder(context, element);
                            },
                          ),
                        ),
                      ),
                    );

                  case PanelDisplayType.none:
                    printDM("CustomChild must not be null");
                    // assert (customChild != null)({}){
                    //   printDM("CustomChild must not be null");
                    // }
                    return customChild ?? const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
      onFeedBack: 0.0.ESH(),
    );
  }
}

class PanelOptions {
  final bool isShrink;
  final double height;
  final double spacer;
  final bool isAnimated;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool isExpanded;
  final ScrollController? scrollController;

  const PanelOptions({
    this.isShrink = false,
    this.isExpanded = false,
    this.margin,
    this.padding,
    this.height = 200,
    this.spacer = 16,
    this.scrollController,
    this.isAnimated = false,
  });
}

class _PanelWrapper extends StatelessWidget {
  final bool isExpanded;

  final Widget child;

  const _PanelWrapper({super.key, this.isExpanded = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: isExpanded,
      onBuild: Expanded(child: child),
      onFeedBack: child,
    );
  }
}
