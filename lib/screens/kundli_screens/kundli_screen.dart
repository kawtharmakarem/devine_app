import 'package:divinecontrol/screens/kundli_screens/life_report_screen.dart';
import 'package:divinecontrol/screens/kundli_screens/match_markting_screen.dart';
import 'package:divinecontrol/screens/kundli_screens/remedies_screen.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundly_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';

class KundliScreen extends StatelessWidget {
  const KundliScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
    appBar:const  CustomAppBar(title: 'Kundli', leading: true),
      body:width<AppConstants.maxTabletWidth? getMobileKundleContent(width, context):getDesktopKundleContent(width, context),
      
    );
  }

  Container getMobileKundleContent(double width, BuildContext context) {
    return Container(
      margin:width<AppConstants.maxMobileWidth? const EdgeInsets.all(10):const EdgeInsets.all(30),
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
           // Text('Kundli',style: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 36:42)),),
            Divider(
            color: AppColors.black.withOpacity(0.8),
            thickness: 2,
            endIndent: 20,
            indent: 20,
           ),
                       const SizedBox(height: 10,),
        
           CustomKundliCard(title: "Match Making", image:AppImages.match, onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MatchMarktingScreen()));
            Get.to(()=>const MatchMarktingScreen(),transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
           }),
           const SizedBox(height: 5,),
           CustomKundliCard(title: "Life Report", image: AppImages.lifereport, onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LifeReportScreen()));
            Get.to(()=>const LifeReportScreen(),transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
           }),
           const SizedBox(height: 5,),
           CustomKundliCard(title: "Remedies", image: AppImages.remediesKundli, onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RemediesScreen(),),);
            Get.to(()=>const RemediesScreen(),transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
           })
          ],
        ),
      ),
    );
  }


  Container getDesktopKundleContent(double width, BuildContext context) {
    return Container(
      margin:width<AppConstants.maxMobileWidth? const EdgeInsets.all(10):const EdgeInsets.all(30),
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
           // Text('Kundli',style: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:60)),),
           const SizedBox(height: 20,),
            Divider(
            color: AppColors.black.withOpacity(0.8),
            thickness: 2,
            endIndent: 20,
            indent: 20,
           ),
                       const SizedBox(height: 20,),
        
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               CustomKundliCard(title: "Match Making", image:AppImages.match, onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MatchMarktingScreen()));
                Get.to(()=>const MatchMarktingScreen(),transition: Transition.zoom,duration: const Duration(seconds: AppConstants.durationSecond));
               }),
               CustomKundliCard(title: "Life Report", image: AppImages.lifereport, onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LifeReportScreen()));
                Get.to(()=>const LifeReportScreen(),transition: Transition.zoom,duration: const Duration(seconds: AppConstants.durationSecond));
               }),
               CustomKundliCard(title: "Remedies", image: AppImages.remediesKundli, onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RemediesScreen()));
                Get.to(()=>const RemediesScreen(),transition: Transition.zoom,duration: const Duration(seconds: AppConstants.durationSecond));
               }),
             ],
           )
          ],
        ),
      ),
    );
  }
}