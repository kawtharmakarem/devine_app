import 'package:device_preview/device_preview.dart';
import 'package:divinecontrol/screens/check_lovers_screens/flowe_screen.dart';
import 'package:divinecontrol/screens/homepage_screens/main_homepage_screen.dart';
import 'package:divinecontrol/screens/settings/header_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';


void main() async {
    await Settings.init(cacheProvider: SharePreferenceCache());

  runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) =>const MyApp(), // Wrap your app
  ),
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    
    return ValueChangeObserver<bool>(
      cacheKey: HeaderPage.keyDarkMode,
      defaultValue: false,
      builder: (_,isDarkMode,__) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
        
          title: 'Divine App',
         //theme: isDarkMode? ThemeData.dark():ThemeData.light(),
         theme: ThemeData.light(),
         routes: {
          "/":(context)=>const MainHomePageScreen(),
          "flowerroute":(context)=>const Flower(),
         },
        );
      }
    );
  }
}

