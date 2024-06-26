
import 'package:divinecontrol/screens/homepage_screens/edit_account.dart';
import 'package:divinecontrol/screens/settings/app_settings_page.dart';
import 'package:divinecontrol/screens/settings/notifications_page.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../utils/app_colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  static const keyLanguage='key-language';
  static const keyLocation='key-location';
  static const keyPassword='key-password';

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return SimpleSettingsTile(
  
    title: 'Account Settings',
  titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
  subtitle: 'Privacy,Security,Language',
  showDivider: false,
  subtitleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 14:20)),
  leading:const IconWidget(color: Colors.green, icon: Icons.person),
  child: SettingsScreen(
    hasAppBar: false,

    title: 'Account Settings',
    children: [
          const  CustomBackButton(title: 'Account Settings',),

      const SizedBox(height: 32,),
      buildLanguage(context,width),
       SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025,),
      buildLocation(context,width),
       SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025,),
      buildPassword(context,width),
             SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025,),

        const SizedBox(child: Divider(thickness: 1,color: AppColors.primary,endIndent: 10,indent: 10,height: 16,),),
               SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025,),

      buildPrivacy(context,width),
       SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025,),
      buildSecurity(context,width),
       SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025,),
  
      buildAcountInfo(context,width),
       SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025,),
      buildEditAccount(context,width),
             SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025,),

              const SizedBox(child: Divider(thickness: 1,color: AppColors.primary,endIndent: 10,indent: 10,height: 16,),),
  
    ]),
  );
  }
  
 Widget buildPrivacy(BuildContext context,double width) =>SimpleSettingsTile(title: 'Privacy',
 subtitle: '',
 showDivider: false,
 titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
 leading:const IconWidget(color: Colors.blue, icon: Icons.lock),
 onTap: (){},);
  
 Widget buildSecurity(BuildContext context,double width) =>SimpleSettingsTile(title: 'Security',
 subtitle: '',
 showDivider: false,
 titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
 leading:const IconWidget(color: Colors.red, icon: Icons.security),
 onTap: (){},);
  
 Widget buildAcountInfo(BuildContext context,double width) =>SimpleSettingsTile(title: 'Account Info',
 subtitle: '',
 showDivider: false,
 titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
 leading:const IconWidget(color: Colors.purple, icon: Icons.text_snippet),
 onTap: (){},
 );
 
 Widget buildLanguage(BuildContext context,double width) =>DropDownSettingsTile(
  subtitle: '',
  title: 'Language', 
 titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
 settingKey: keyLanguage,
 showDivider: false, 
  subtitleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 14:24)),
 selected: 1, 

 values:const {
  1:'English',
  2:'Spanish',
  3:'Arabic',
  4:'Hindi',
 },
 
 onChange: (language){},);
  
Widget  buildLocation(BuildContext context,double width) =>TextInputSettingsTile(
  
  title: 'Location', 
 titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),

settingKey: keyLocation,
initialValue: 'Syria',
  subtitleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 14:24)),
onChange: (location){},
);

 Widget buildPassword(BuildContext context,double width) =>TextInputSettingsTile(title: 'Password', settingKey: keyPassword,
 titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
 obscureText: true,
 validator: (password)=>password!=null && password.length>=6 ? null :'Enter 6 characters',);
 
 Widget buildEditAccount(BuildContext context,double width)=>SimpleSettingsTile(title: 'Edit Account',
 titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
 showDivider: false,
 leading:const IconWidget(color: Colors.purple, icon: Icons.edit),
 onTap: (){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EditAccountScreen()));
 },);

  
}