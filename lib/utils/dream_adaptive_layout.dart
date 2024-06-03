import 'package:flutter/material.dart';

import 'app_constants.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({super.key, required this.mobileLayout, required this.tabletLayout, required this.desktopLayout});
   final WidgetBuilder mobileLayout,tabletLayout,desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth<AppConstants.maxMobileWidth){
          return mobileLayout(context);
        }else if(constraints.maxWidth<AppConstants.maxTabletWidth){
          return tabletLayout(context);
        }else{
          return desktopLayout(context);
        }
      },
    );
  }
}