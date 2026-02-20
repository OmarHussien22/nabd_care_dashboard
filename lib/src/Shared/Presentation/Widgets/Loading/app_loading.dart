import 'loading_box.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

//TODO 7.a : change to loading widget
class AppLoader extends StatelessWidget {
  final bool? isFullScreen;
  final double? heightRatio;
  const AppLoader({super.key, this.isFullScreen, this.heightRatio});

  @override
  Widget build(BuildContext context) {
    return LoadingBox(
      isFullScreen: isFullScreen ?? false,
      heightRatio: heightRatio ?? 2,
      loading: Loading.inkDrop(),
    );
  }
}
