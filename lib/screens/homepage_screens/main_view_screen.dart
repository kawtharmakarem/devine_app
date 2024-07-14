
import 'package:divinecontrol/screens/settings/app_settings_page.dart';
import 'package:divinecontrol/screens/settings/contactus_screen.dart';
import 'package:divinecontrol/screens/shopping_screens/shopping_main_screen.dart';
import 'package:divinecontrol/screens/todayluck_screens/today_luck_screen.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/dream_desktop_layout.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/dream_mobile_layout.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/dream_tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class MainViewScreen extends StatefulWidget {
  const MainViewScreen({super.key});

  @override
  State<MainViewScreen> createState() => _MainViewScreenState();
}

class _MainViewScreenState extends State<MainViewScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  MotionTabBarController? _motionTabBarController;
  String? title;
  final titles = [
    'Divine Connection',
    'shopping',
    'Today\'s Lucky',
    'Settings',
        "Contact"

  ];
  final _screens = [
  const DesktopLayout(),
   const ShoppingMainPage(),
         const  TodaysLuckScreen(),
          const  SettingsPage(),
          const ContactUsScreen()
  ];

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      length: 5,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
   

    double width = MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary.withOpacity(0.3),
          title: Text(width<AppConstants.maxTabletWidth? title ?? 'Divine Connection':titles[currentIndex],style:width<AppConstants.maxTabletWidth? AppStyles.styleRufinaBold32(context).copyWith(color: AppColors.darkPrimary):AppStyles.styleRufinaBold32(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize: 40)),),
          centerTitle: true,
          
        ),
        bottomNavigationBar:width<AppConstants.maxTabletWidth? MotionTabBar(
          controller: _motionTabBarController,
          initialSelectedTab: 'Connect',
          labels: const ['Connect', 'Shopping', 'Lucky', 'Settings','Contact'],
          onTabItemSelected: (value) {
            setState(() {
              _motionTabBarController!.index = value;
              title = titles[value];
            });
          },
          icons: const [
            Icons.search,
            Icons.shopping_cart,
            Icons.card_giftcard,
            Icons.settings,
            Icons.phone
          ],
          textStyle: AppStyles.styleBold20(context).copyWith(
              color: AppColors.darkPrimary,
              fontSize: getResponsiveFontSizeText(context,
                  fontSize: width < AppConstants.maxMobileWidth ? 16 : 28)),
          tabIconColor: AppColors.primary,
          tabIconSize: width < AppConstants.maxMobileWidth ? 40.0 : 80.0,
          tabIconSelectedSize: width < AppConstants.maxMobileWidth ? 28.0 : 65,
          tabSelectedColor: AppColors.darkPrimary,
          tabIconSelectedColor: Colors.white,
          tabBarColor: Colors.white,
          tabSize: width < AppConstants.maxMobileWidth ? 60 : 100,
          tabBarHeight: width < AppConstants.maxMobileWidth ? 65 : 100,
        ):null,
        body:width<AppConstants.maxTabletWidth? TabBarView(
          controller: _motionTabBarController,
          physics:
              const NeverScrollableScrollPhysics(), 

          children: [
         width<AppConstants.maxMobileWidth?const  MobileLayout():const TabletLayout(),
           const ShoppingMainPage(),
         const  TodaysLuckScreen(),
          const  SettingsPage(),
          const ContactUsScreen()
          ],
        ):Row(
          children: [
            NavigationRail(
                backgroundColor: AppColors.primary.withOpacity(0.3),
                onDestinationSelected: (index) {
                  setState(() {
                    currentIndex= index;
                  });
                },
                labelType: NavigationRailLabelType.selected,
                selectedIconTheme: const IconThemeData(
                    color: AppColors.darkPrimary, size: 70, applyTextScaling: true),
                unselectedIconTheme:const IconThemeData(
                    color: AppColors.primary,
                    size: 80,
                    applyTextScaling: true),
                selectedLabelTextStyle: AppStyles.styleBold20(context)
                    .copyWith(color: AppColors.darkPrimary),
                destinations: [
                  NavigationRailDestination(
                    
                      padding: EdgeInsets.only(
                          bottom: height * 0.05, left: 10, right: 10),
                      
                      icon:const Icon(
                        Icons.search,
                      ),
                      label:const Text('Connect')),
                  NavigationRailDestination(
                    padding:EdgeInsets.only(
                          bottom: height * 0.05, left: 10, right: 10), 
                      icon:const Icon(Icons.shopping_cart), label:const Text('Shopping')),
                  NavigationRailDestination(
                    padding: EdgeInsets.only(
                          bottom: height * 0.05, left: 10, right: 10),
                      icon:const Icon(Icons.card_giftcard), label:const Text('Lucky')),
                  NavigationRailDestination(
                    padding: EdgeInsets.only(
                          bottom: height * 0.05, left: 10, right: 10),
                      icon:const Icon(
                        Icons.settings,
                      ),
                      label:const Text('Setting')),
                       NavigationRailDestination(
                    padding: EdgeInsets.only(
                          bottom: height * 0.05, left: 10, right: 10),
                      icon:const Icon(
                        Icons.phone,
                      ),
                      label:const Text('Contact')),
                ],
                selectedIndex: currentIndex),
            Expanded(child: _screens[currentIndex]),
          ],
        ));
  }
}
