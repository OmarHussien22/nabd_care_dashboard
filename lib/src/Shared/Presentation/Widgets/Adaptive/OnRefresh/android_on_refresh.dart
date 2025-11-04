
 part of 'imports_on_refresh.dart';

/// add ios here
class AndroidOnRefresh extends StatelessWidget {
  final RefreshCallback onRefresh;
  final ScrollController? scrollController;
  final List<Widget> children;
  final ScrollPhysics? physics;

  const AndroidOnRefresh({
    super.key,
    required this.onRefresh,
    this.scrollController,
    required this.children,
    this.physics=AppPhysics.alwaysScrollablePhysics,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.get.onRefreshIndicator,
      displacement: 60.toH(),
      strokeWidth: 3.0,
      backgroundColor: AppColors.get.white,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: ListView(
        physics: physics,
        controller: scrollController,
        children: children,
      ),
    );
  }
}
