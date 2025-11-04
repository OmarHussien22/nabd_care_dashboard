import 'package:flutter/material.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Features/home/presentation/widgets/home_sales_graph_widget.dart';
import 'package:getx_base_code/src/Features/home/presentation/widgets/home_statics_grid_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0.toRad()),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HomeHeaderWidget(),
            // 15.ESH(),
            HomeStaticsGridWidget(),
            15.ESH(),
            HomeSalesGraphWidget(),
          ],
        ),
      );
  }
}
