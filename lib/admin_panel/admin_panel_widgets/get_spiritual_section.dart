
import 'package:divinecontrol/admin_panel/admin_panel_models/adminpanel_card_model.dart';
import 'package:divinecontrol/admin_panel/admin_panel_widgets/custom_adminpanel_card.dart';
import 'package:divinecontrol/screens/dream_meaning_screens/dream_main_view.dart';
import 'package:divinecontrol/screens/emotion_screens/emotion_screen.dart';
import 'package:divinecontrol/screens/homepage_screens/main_view_screen.dart';
import 'package:divinecontrol/screens/meditation_screens/meditation_screen.dart';
import 'package:divinecontrol/screens/numerology_screens/numerology_main_screen.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class GetSpiritualSection extends StatelessWidget {
  const GetSpiritualSection({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Row(children: [
          Icon(Icons.monitor_heart_sharp,size: 40,color: AppColors.myLightRed,),
         // Image.asset(AppImages.feeltarot,width: 40,height: 40,fit: BoxFit.cover,),
        Text('Spiritual',style: AppStyles.styleRufinaBold32(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),),
        

        ],),

        SizedBox(height:height/7,child: ListView(shrinkWrap: true,scrollDirection: Axis.horizontal,
        children: [
          CustomAdminPanelCard(cardModel: AdminCardModel(title: "All" ,image: AppImages.feeltarot,openBuilder: (context,_)=>MainViewScreen())),
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
    AdminCardModel(title: "Dream Meaning", image: AppImages.dream, openBuilder: (context,_)=>DreamMeaningMainView()),
    AdminCardModel(title: "Numerology", image: AppImages.numerologyLogo, openBuilder: (context,_)=>NumerologyMainScreen()),
    AdminCardModel(title: "Meditation", image: AppImages.meditationLogo, openBuilder: (context,_)=>MeditationScreen()),
    AdminCardModel(title: "Emotional Support", image: AppImages.emotionLogo, openBuilder: (context,_)=>EmotionScreen()),


  ];

}