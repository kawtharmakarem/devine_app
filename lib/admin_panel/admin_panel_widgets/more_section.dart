import 'package:divinecontrol/admin_panel/admin_panel_widgets/custom_more_button.dart';
import 'package:divinecontrol/screens/auth_screens/edit_account.dart';
import 'package:divinecontrol/screens/settings/app_settings_page.dart';
import 'package:divinecontrol/screens/settings/contactus_screen.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utils/app_styles.dart';

class MoreSection extends StatelessWidget {
  const MoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                Row(
                  children: [
                    Image.asset(AppImages.logoonly,height: 40,width: 40,fit: BoxFit.cover,),
                    Text('More',style: AppStyles.styleRufinaBold32(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),),
                  ],
                ),

             CustomMoreButton(title: "Settings", icon: Icons.settings,onTap: ()=>Get.to(()=>SettingsPage(),transition: Transition.size,duration: const Duration(seconds: AppConstants.durationSecond))) 
             ,const SizedBox(height: 10,),
             CustomMoreButton(title: "Contact Us", onTap: ()=>Get.to(()=>ContactUsScreen(),transition: Transition.size,duration: const Duration(seconds: AppConstants.durationSecond)), icon: FontAwesomeIcons.phoneVolume)
            , const SizedBox(height: 10,),
            CustomMoreButton(title: "Update My Info", onTap: ()=>Get.to(()=>EditAccountScreen(),transition: Transition.size,duration: const Duration(seconds: AppConstants.durationSecond)), icon: Icons.update)
      ],
    );
  }
}

