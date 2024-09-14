import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomQuestionCard extends StatelessWidget {
  const CustomQuestionCard({
    super.key, required this.question,this.onTap,this.icon
  });

final String question;
final IconData? icon;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primary,
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
      
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           icon!=null? Icon(icon,size: 40,color: AppColors.darkPrimary,):SizedBox(),
            Center(child: Text(question,textAlign: TextAlign.center,style: AppStyles.styleBold24(context).copyWith(
                            color: AppColors.darkPrimary,
                            fontWeight: FontWeight.w800,
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 16),),),),
          ],
        ),),
    );
  }
}