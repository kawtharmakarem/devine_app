import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppImages.background),
          ),
         
         Positioned(
            bottom: height*0.3,
            left: 0,
            right: 0,
            child: Image.asset(AppImages.companyLogo)),
        
      ],),
    );
  }
}



// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_mvvm/app/app_prefs.dart';
// import 'package:flutter_mvvm/app/di.dart';
// import 'package:flutter_mvvm/presentation/resources/assets_manager.dart';
// import 'package:flutter_mvvm/presentation/resources/color_manager.dart';
// import 'package:flutter_mvvm/presentation/resources/constants_manager.dart';

// import '../../resources/routes_manager.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   Timer? _timer;
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//   _startDelay(){
//     _timer=Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
//   }
//   void _goNext() async{
//     _appPreferences.isUserLoggedIn().then((isUserLoggedIn){
//       if(isUserLoggedIn){
//        //goto main screen
//        Navigator.pushReplacementNamed(context, Routes.mainRoute);
//       }else{
//           _appPreferences.isOnBoardingScreenViewed().then((isOnBoardingScreenviewed){
//             if(isOnBoardingScreenviewed){
//             Navigator.pushReplacementNamed(context, Routes.loginRoute);
//             }else{
//            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
//             }
//           });
//       }
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     _startDelay();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.primary,
//       body:const Center(child:  Image(image: AssetImage(ImageAssets.splashLogo))),
       
//     );
//   }

//  @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   } 
// }