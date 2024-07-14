import 'package:divinecontrol/screens/settings/app_settings_page.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});
  static const keyDarkMode='key-dark-mode';

  @override
  Widget build(BuildContext context){
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
   return Column(
    children: [
      buildHeader(),
      const SizedBox(height: 32,),
      buildUser(context,width),
      SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025 ,),
     // buildDarkMode(context,width),
      



    ],
  );
  }
 Widget buildHeader() =>Container();
  
 Widget buildUser(BuildContext context,double width) => SimpleSettingsTile(title: 'Kawthar makarem',
 titleTextStyle:AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
 showDivider: false,
 subtitle: '+963 998 199 626',
 subtitleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:24)),
 leading:const IconWidget(color: Colors.grey, icon: Icons.person),);
  
//  Widget buildDarkMode(BuildContext context,double width) =>SwitchSettingsTile(title: 'Dark Mode',
 
//  showDivider: false,
//   settingKey: keyDarkMode,
//   titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
//  leading:const IconWidget(color: Color(0xff462ef3), icon: Icons.dark_mode),
//  onChange: (isDarkMode){
 
//  },
//  );
}