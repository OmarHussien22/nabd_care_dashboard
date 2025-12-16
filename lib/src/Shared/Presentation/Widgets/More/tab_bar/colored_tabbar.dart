import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';

class ColoredTabBar extends Container implements PreferredSizeWidget {
  final TabBar tabBar;

  @override
  final Color? color;

  ColoredTabBar({
    super.key,
    this.color,
    required this.tabBar,
  });

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        height: 48.toH(),
        color: color,
        child: tabBar,
      );
}
