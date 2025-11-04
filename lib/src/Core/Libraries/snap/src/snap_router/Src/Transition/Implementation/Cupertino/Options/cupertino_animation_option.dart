import 'package:getx_base_code/src/Core/Libraries/snap/src/snap_router/Src/Helper/Interfaces/helper_imports.dart';

class CupertinoAnimationOptions extends AnimationOption {
  final bool isFullscreenDialog;
  final bool isLinearTransition;
  const CupertinoAnimationOptions({
    this.isFullscreenDialog = false,
    this.isLinearTransition = false,
    super.duration,
    super.curve,
    super.reverseCurve,
    super.reverseDuration,
  });
}
