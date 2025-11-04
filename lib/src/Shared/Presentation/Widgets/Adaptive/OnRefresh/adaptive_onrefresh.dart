part of 'imports_on_refresh.dart';

class AdaptiveOnRefresh extends StatelessWidget {
  final RefreshCallback onRefresh;
  final ScrollController? scrollController;
  final List<Widget>? children;
  final List<Widget>? slivers;
  final ScrollPhysics? physics;

  const AdaptiveOnRefresh({
    super.key,
    required this.onRefresh,
    this.scrollController,
    this.children,
    this.slivers,
    this.physics = AppPhysics.alwaysScrollablePhysics,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: (getOS == ios),
      onBuild: IOSOnRefresh(
        key: key,
        onRefresh: () async {
          // Helper.localAudio.play(Assets.audioPull);
          await onRefresh().then((value) {
            // Helper.localAudio.play(Assets.audioRefresh);
          });
        },
        scrollController: scrollController,
        physics: physics,
        slivers: slivers,
        children: children,
      ),
      onFeedBack: AndroidOnRefresh(
        key: key,
        onRefresh: () async {
          // Helper.localAudio.play(Assets.audioPull);
          await onRefresh().then((value) {
            // Helper.localAudio.play(Assets.audioRefresh);
          });
        },
        physics: physics,
        scrollController: scrollController,
        children: children ?? [],
      ),
    );
  }
}
