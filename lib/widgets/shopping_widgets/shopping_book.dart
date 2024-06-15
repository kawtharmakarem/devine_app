import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ShoppingBookWidget extends StatelessWidget {
  const ShoppingBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      width: double.maxFinite,
      padding:const EdgeInsets.all(30),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      SizedBox(
        width: width/5,
        height: width/5,
        child: Image.asset(AppImages.shani,fit: BoxFit.fill,)),
      const SizedBox(height: 30,),
      Text('Welcome To Pooja Book',style: AppStyles.styleBold24(context),)
    ],),);
  }
}