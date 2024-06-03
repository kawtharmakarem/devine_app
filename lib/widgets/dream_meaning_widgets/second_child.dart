import 'package:divinecontrol/screens/dream_meaning_screens/dream_meaning.dart';
import 'package:divinecontrol/screens/dream_meaning_screens/sleep_music_screen.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../screens/dream_meaning_screens/dream_book.dart';
import '../../utils/app_images.dart';
import 'custom_book_card.dart';

class SecondChild extends StatelessWidget {
  const SecondChild({super.key});
   
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return width<AppConstants.maxTabletWidth? getMobileSecondWidget(context):getDesktopSecondWidget(context);
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
       const SizedBox(height: 30,)
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