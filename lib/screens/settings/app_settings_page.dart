import 'package:divinecontrol/screens/settings/account_page.dart';
import 'package:divinecontrol/screens/settings/header_page.dart';
import 'package:divinecontrol/screens/settings/notifications_page.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return Scaffold(body: 
    ListView(
      children: [
        
        SettingsGroup(title: 'GENERAl',
        titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 22)),
         children: [
        const  HeaderPage(),
                     SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025 ,),

         const AccountPage(),
                              SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025 ,),

         const NotificationsPage(),
                              SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025 ,),

          buildLogout(width),
                     SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025 ,),
          buildDeleteAccount(width),
                               SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025 ,),

        ]),
        const SizedBox(child: Divider(thickness: 1,color: AppColors.primary,endIndent: 10,indent: 10,height: 16,),),
        SettingsGroup(title: 'FEEDBACK', 
        titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 22)),
        children: [
           SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025,),
          buildReportBug(width),
           SizedBox(height:width<AppConstants.maxMobileWidth? height*0.012:height*0.025,),
          buildSendFeedBack(width),
        ])
      ],
    ));
  }

  Widget buildLogout(double width)=>SimpleSettingsTile(
    title: 'Logout',
    titleTextStyle:width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context):AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),
    subtitle: '',
    showDivider: false,
    leading:const IconWidget(icon:Icons.logout,color:Colors.blueAccent,),
    onTap: (){
      Settings.clearCache();
    });

    Widget buildDeleteAccount(double width)=>SimpleSettingsTile(

      title: 'DeleteAccount',
    titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
    subtitle: '',showDivider: false,
        leading:const IconWidget(icon:Icons.delete,color:Colors.pink),

    onTap: (){});

    Widget buildReportBug(double width)=>SimpleSettingsTile(title: 'Repoer A Bug',
    subtitle: '',
    titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
    showDivider: false,
    leading:const IconWidget(color: Colors.teal, icon: Icons.bug_report),
    onTap: (){},);

    Widget buildSendFeedBack(double width)=>SimpleSettingsTile(title: 'Send FeedBack',
    subtitle: '',
    showDivider: false,
    titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
    leading:const IconWidget(color: Colors.purple, icon: Icons.thumb_up),
    onTap: (){},);
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.color, required this.icon});
final Color color;
final IconData icon;
  @override
  Widget build(BuildContext context){
    double width=MediaQuery.sizeOf(context).width;
   return Transform.scale(
    scale: width<AppConstants.maxMobileWidth? 1:2,
     child: CircleAvatar(
        radius:40,
        backgroundColor: color,
        child: Icon(icon,color: Colors.white,),
      
        ),
   );
  }
}