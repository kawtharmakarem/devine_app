import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';


class SeeMore extends StatelessWidget {
  const SeeMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     
    return InkWell(
      splashColor: AppColors.purple,
      onTap: (){
        showDialog(context: context, builder:(context)=>const AlertDialog(
          alignment: Alignment.bottomCenter,
          content: Text('Click to see more'),));
      },
      child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
       Text('SeeMore',style: AppStyles.styleBold24(context).copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 30)),),
      const Icon(Icons.arrow_drop_down)
                ],),
    );
  }
}


 