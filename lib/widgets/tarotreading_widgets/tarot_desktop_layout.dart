import 'package:divinecontrol/widgets/tarotreading_widgets/custom_drawer.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/tarot_read_body.dart';
import 'package:flutter/material.dart';

class TarotDesktopLayout extends StatelessWidget {
  const TarotDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return    const Column(
      children: [
        CustomDrawer(),
        Expanded(child: TarotReadViewBody())
      ],
    );
  }
}