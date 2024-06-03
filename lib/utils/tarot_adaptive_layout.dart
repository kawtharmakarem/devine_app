import 'package:divinecontrol/utils/tarot_constants.dart';
import 'package:flutter/material.dart';

class TarotAdaptiveLayout extends StatelessWidget {
  const TarotAdaptiveLayout({super.key, required this.mobileLayout, required this.tabletLayout, required this.desktopLayout});
  final WidgetBuilder mobileLayout,tabletLayout,desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
    if(constraints.maxWidth<TarotAppConstants.mobileMaxWidth){
      return mobileLayout(context);
    }else if(constraints.maxWidth<TarotAppConstants.tabletMaxWidth){
      return tabletLayout(context);
    }else{
      return desktopLayout(context);
    }
    });
  }
}