import 'package:care_desk/src/Features/Acts/presentation/widgets/acts_content.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/pages/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActsPage extends StatelessWidget {
  const ActsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      child: ActsContent(),
    );
  }
}

