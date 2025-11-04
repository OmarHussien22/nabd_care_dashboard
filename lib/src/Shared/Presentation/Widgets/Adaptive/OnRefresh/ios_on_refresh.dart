part of 'imports_on_refresh.dart';

class IOSOnRefresh extends StatelessWidget {
  final RefreshCallback onRefresh;
  final ScrollController? scrollController;
  final List<Widget>? children;
  final List<Widget>? slivers;
  final ScrollPhysics? physics;

  const IOSOnRefresh({
    super.key,
    required this.onRefresh,
    required this.children,
    this.scrollController,
    this.slivers,
    this.physics = AppPhysics.alwaysScrollablePhysics,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: physics,
      controller: scrollController,
      slivers: [

        cupertino.CupertinoTheme(
          data: cupertino.CupertinoThemeData(
            primaryColor: AppColors.get.onRefreshIndicator,
          ),
          child: cupertino.CupertinoSliverRefreshControl(
            onRefresh: onRefresh,

          ),
        ),
        if (children != null)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: children!,
                );
              },
              childCount: 1,
            ),
          ),
        if (slivers != null) ...slivers!,
      ],
    );
  }
}

