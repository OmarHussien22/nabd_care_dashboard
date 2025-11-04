import 'package:getx_base_code/src/Shared/Presentation/Widgets/Loading/loading_box.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

//TODO 7.a : change to loading widget
class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingBox(
      loading: Loading.stretchedDots(),
    );
  }
}
