import 'package:divinecontrol/utils/dream_adaptive_layout.dart';
import 'package:divinecontrol/widgets/homepage_widgets/homepage_desktop_layout.dart';
import 'package:divinecontrol/widgets/homepage_widgets/homepage_mobile_layout.dart';
import 'package:divinecontrol/widgets/homepage_widgets/homepage_tablet_layout.dart';
import 'package:flutter/material.dart';

class MainHomePageScreen extends StatefulWidget {
  const MainHomePageScreen({super.key});

  @override
  State<MainHomePageScreen> createState() => _MainHomePageScreenState();
}

class _MainHomePageScreenState extends State<MainHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: AdaptiveLayout(
          mobileLayout: (context) =>const HomePageMobileLayout(),
          tabletLayout: (context) => const HomePageTabletLayout(),
          desktopLayout: (context) =>const  HomePageDesktopLayout()),
    ));
  }
}
