import 'package:flutter/material.dart';

import 'tarot_read_body.dart';

class TarotTabletLayout extends StatelessWidget {
  const TarotTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // CustomDrawer(),
        Expanded(child: TarotReadViewBody())
      ],
    );
  }
}