import 'package:divinecontrol/screens/dream_meaning_screens/dream_meaning.dart';
import 'package:divinecontrol/screens/dream_meaning_screens/sleep_music_screen.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/dream_meaning_screens/dream_book.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../widgets/dream_meaning_widgets/custom_book_card.dart';

class DreamMeaningMainView extends StatelessWidget {
  const DreamMeaningMainView({super.key});
   
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
     return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
        title: Text(
          'Dream Interpretation',
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
        ),
        backgroundColor: AppColors.lightPurple1,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.leftArrow),
        ),
      ),
      body:   width<AppConstants.maxTabletWidth? getMobileSecondWidget(context):getDesktopSecondWidget(context));
  }

  SingleChildScrollView getMobileSecondWidget(BuildContext context) {
    return SingleChildScrollView(
    child: Column(
      children: [
        CustomBookCard(onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DreamMeaning()));
        }, image: AppImages.meaning, title: 'Dream Meaning'),
       CustomBookCard(onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DreamBookPage()));
       }, image: AppImages.book, title: 'Dream Book'),
        CustomBookCard(onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return const SleepMusicScreen();
          }));
        }, image: AppImages.head, title: 'Sleep Music'),
       const SizedBox(height: 30,width: double.infinity,)
      ],
    ),
  );
  }


   SingleChildScrollView getDesktopSecondWidget(BuildContext context) {
    return SingleChildScrollView(
    child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomBookCard(onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DreamMeaning()));
        }, image: AppImages.meaning, title: 'Dream Meaning'),
       CustomBookCard(onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DreamBookPage()));
       }, image: AppImages.book, title: 'Dream Book'),
         
        CustomBookCard(onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return const SleepMusicScreen();
          }));
        }, image: AppImages.head, title: 'Sleep Music'),
        
      ],
    ),
    );
  }
}