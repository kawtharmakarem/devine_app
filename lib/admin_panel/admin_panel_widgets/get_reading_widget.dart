
import 'package:divinecontrol/admin_panel/admin_panel_models/adminpanel_card_model.dart';
import 'package:divinecontrol/admin_panel/admin_panel_widgets/custom_adminpanel_card.dart';
import 'package:divinecontrol/screens/face_reading_screens/face_reading_view.dart';
import 'package:divinecontrol/screens/homepage_screens/main_view_screen.dart';
import 'package:divinecontrol/screens/palemreading_screens/palemreading_screen.dart';
import 'package:divinecontrol/screens/tarot_reading_screens/main_tarot_read_view.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class GetReadingSection extends StatelessWidget {
  const GetReadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Row(children: [
          Image.asset(AppImages.onboardingfirst,width: 40,height: 40,fit: BoxFit.cover,),
        Text('Get Reading',style: AppStyles.styleRufinaBold32(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),),
        

        ],),

        SizedBox(height:height/7,child: ListView(shrinkWrap: true,scrollDirection: Axis.horizontal,
        children: [
          CustomAdminPanelCard(cardModel: AdminCardModel(title: "All" ,image: AppImages.tarotCardGirl,openBuilder: (context,_)=>MainViewScreen())),
          const SizedBox(width: 5,),
          ...List.generate(getReadingList.length, (index) => Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CustomAdminPanelCard(cardModel: getReadingList[index]),
          ))

        ],),)

      ],
    );
  }
  static List<AdminCardModel> getReadingList=[
    AdminCardModel(title: "Tarot Reading", image: AppImages.tarotLogo, openBuilder: (context,_)=>MainTarotReadView()),
    AdminCardModel(title: "Face Reading", image: AppImages.facelogo, openBuilder: (context,_)=>FaceReadingView()),
    AdminCardModel(title: "Palm Reading", image: AppImages.palemreadingLogo, openBuilder: (context,_)=>PalemReadingScreen()),


  ];

}