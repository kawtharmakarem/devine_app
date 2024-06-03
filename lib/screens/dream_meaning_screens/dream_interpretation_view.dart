import 'package:flutter/material.dart';

import '../../utils/dream_adaptive_layout.dart';
import '../../widgets/dream_meaning_widgets/dream_desktop_layout.dart';
import '../../widgets/dream_meaning_widgets/dream_mobile_layout.dart';
import '../../widgets/dream_meaning_widgets/dream_tablet_layout.dart';

class DreamInterpretationView extends StatelessWidget {
  const DreamInterpretationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AdaptiveLayout(
            mobileLayout: (context) =>const MobileLayout(),
            tabletLayout: (context) =>const TabletLayout(),
            desktopLayout: (context) =>const DesktopLayout()),
      ),
    );
  }
}
