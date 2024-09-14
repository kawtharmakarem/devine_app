
import 'package:divinecontrol/admin_panel/admin_panel_models/adminpanel_card_model.dart';
import 'package:divinecontrol/admin_panel/admin_panel_widgets/custom_adminpanel_card.dart';
import 'package:divinecontrol/screens/astrology_screens/astrology_screen.dart';
import 'package:divinecontrol/screens/check_lovers_screens/flowe_screen.dart';
import 'package:divinecontrol/screens/fortunewheel_screens/fortunewheel_screen.dart';
import 'package:divinecontrol/screens/homepage_screens/main_view_screen.dart';
import 'package:divinecontrol/screens/horoscope_screens/horoscope_screen.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_styles.dart';

class GetAstrologySection extends StatelessWidget {
  const GetAstrologySection({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Row(children: [
          Icon(FontAwesomeIcons.moon,size: 40,color: Colors.blue,),
         // Image.asset(AppImages.logoonly,width: 40,height: 40,fit: BoxFit.cover,),
        Text('Astrology',style: AppStyles.styleRufinaBold32(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),),
        

        ],),

        SizedBox(height:height/7 ,child: ListView(shrinkWrap: true,scrollDirection: Axis.horizontal,
        children: [
          CustomAdminPanelCard(cardModel: AdminCardModel(title: "All", image: AppImages.onboardingcard,openBuilder: (context,_)=>MainViewScreen())),
          const SizedBox(width: 5,),
          ...List.generate(getAstrologyList.length, (index) => Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CustomAdminPanelCard(cardModel: getAstrologyList[index]),
          ))

        ],),)

      ],
    );
  }
  static List<AdminCardModel> getAstrologyList=[
    AdminCardModel(title: "Astrology", image: AppImages.astrologylogo, openBuilder: (context,_)=>AstrologyMainPage()),
    AdminCardModel(title: "Horoscope", image: AppImages.horoscopelogo, openBuilder: (context,_)=>HoroscopeScreen()),
    AdminCardModel(title: "Love Check", image: AppImages.checklovelogo, openBuilder: (context,_)=>Flower()),
    AdminCardModel(title: "Fortune Wheel", image: AppImages.fortunewheellogo,openBuilder: (context,_)=>MyFortuneWheel())


  ];

}