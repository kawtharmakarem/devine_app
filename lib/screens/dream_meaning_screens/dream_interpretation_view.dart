import 'package:divinecontrol/screens/main_screens/main_drawer.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';
import '../../utils/dream_adaptive_layout.dart';
import '../../widgets/dream_meaning_widgets/dream_desktop_layout.dart';
import '../../widgets/dream_meaning_widgets/dream_mobile_layout.dart';
import '../../widgets/dream_meaning_widgets/dream_tablet_layout.dart';

class DreamInterpretationView extends StatefulWidget {
  const DreamInterpretationView({super.key});

  @override
  State<DreamInterpretationView> createState() => _DreamInterpretationViewState();
}

class _DreamInterpretationViewState extends State<DreamInterpretationView> {
  GlobalKey<ScaffoldState> key=GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: key,
        appBar:width<AppConstants.maxTabletWidth? getAppBar(width, context):null,
        drawer:width<AppConstants.maxTabletWidth? const MainDrawer():null,
        body: AdaptiveLayout(
            mobileLayout: (context) =>const MobileLayout(),
            tabletLayout: (context) =>const TabletLayout(),
            desktopLayout: (context) =>const DesktopLayout()),
      ),
    );
  }

  AppBar getAppBar(double width, BuildContext context) {
    return AppBar(
      title: Text(
        'Divine App',
        style: width < AppConstants.maxMobileWidth
            ? AppStyles.styleBold24(context)
                .copyWith(color: AppColors.darkPrimary)
            : AppStyles.styleBold24(context).copyWith(
                color: AppColors.darkPrimary,
                fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
      ),
      backgroundColor: AppColors.primary,
      centerTitle: true,
      leading: IconButton(onPressed: (){
          key.currentState!.openDrawer();
      }, icon: Icon(Icons.menu,size: width<AppConstants.maxMobileWidth? 40:60,)),
     
    );
  }
}
