import 'package:flutter/material.dart';

import '../widgets/illustration_blocked_acc.dart';

class BlockedPage extends StatelessWidget {
  const BlockedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: IllustrationBlockedAcc(),
      ),
    );
  }
}
