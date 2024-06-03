import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({super.key});

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  List<bool> isSelected = [false, true];
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ToggleButtons(
        
        isSelected: isSelected,
        selectedColor: AppColors.white,
        
        color: Colors.black.withOpacity(0.7),
        //fillColor: AppColors.black,
        renderBorder: true,
        borderRadius: BorderRadius.circular(20),
        borderWidth: 3,
        //splashColor: AppColors.lightPurple2,

        children: [
          Padding(
            padding: width<AppConstants.maxTabletWidth? EdgeInsets.symmetric(horizontal: 10, vertical: 5):EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Row(
              children: [
                Image.asset(AppImages.chat),
                Text(
                  'chat',
                  style:width<AppConstants.maxTabletWidth? AppStyles.styleBold24(context)
                      .copyWith(color: AppColors.black):AppStyles.styleBold32(context).copyWith(color: AppColors.black),
                )
              ],
            ),
          ),
          Padding(
              padding: width<AppConstants.maxTabletWidth? EdgeInsets.symmetric(horizontal: 10, vertical: 5):EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.blue,
                  size: 32,
                ),
                Text(
                  'call',
                  style:width<AppConstants.maxTabletWidth? AppStyles.styleBold24(context)
                      .copyWith(color: AppColors.black):AppStyles.styleBold32(context).copyWith(color: AppColors.black),
                )
              ],
            ),
          )
        ],
        onPressed: (newIndex) {
          setState(() {
            for (int index = 0; index < isSelected.length; index++) {
              if (index == newIndex) {
                isSelected[index] = true;
              } else {
                isSelected[index] = false;
              }
              if(index==0 && isSelected[index]){
                showDialog(context: context, builder: (context)=>AlertDialog(content: Text('Chat ,we can help you',style: AppStyles.styleRegular20(context)),alignment: Alignment.topRight,));
              }
              if(index==1 && isSelected[index]){
                                showDialog(context: context, builder: (context)=>AlertDialog(content: Text('Call Me',style: AppStyles.styleRegular20(context)),alignment: Alignment.topRight,));

              }
            }
          });
        },
      ),
    );
  }
}
