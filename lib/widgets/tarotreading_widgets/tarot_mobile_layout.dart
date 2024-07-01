

import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import 'tarot_read_body.dart';



class TarotMobileLayout extends StatelessWidget {
  const TarotMobileLayout({super.key});


  @override
  Widget build(BuildContext context) {
      // String quest=ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightPurple2,
        title: Text("Your Favourite",style: AppStyles.styleBold24(context).copyWith(color: AppColors.darkPrimary),),
      automaticallyImplyLeading: false,
      actions: [IconButton(onPressed: (){
        Get.back();
      }, icon:const Icon(Icons.close_sharp,size: 30,color: AppColors.darkPrimary,))],
      ),
      body:const Column(children: [
        Expanded(child: TarotReadViewBody())
      ],),
    );
  }
}