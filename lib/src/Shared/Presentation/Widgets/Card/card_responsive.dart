import 'package:flutter/material.dart';

class CardResponsive extends StatelessWidget {
  final Widget child;

  final BoxConstraints constraints;
  const CardResponsive(
      {super.key, required this.child, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return _buildResponsiveStat(constraints: constraints, child: child);
  }
}

Widget _buildResponsiveStat(
    {required BoxConstraints constraints, required Widget child}) {
  double width;
  if (constraints.maxWidth < 600) {
    width = constraints.maxWidth;
  } else if (constraints.maxWidth < 1100) {
    width = (constraints.maxWidth - 20) / 2;
  } else {
    width = (constraints.maxWidth - 100) / 4;
  }
  return SizedBox(width: width, child: child);
}
