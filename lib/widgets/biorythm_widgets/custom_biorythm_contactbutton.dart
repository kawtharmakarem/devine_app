import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';


class CustomBiorythmContactButton extends StatefulWidget {
  const CustomBiorythmContactButton({super.key, required this.title, required this.onTap, required this.icon});
  final String title;
  final IconData icon;
  final void Function() onTap;
   

  @override
  State<CustomBiorythmContactButton> createState() => _CustomBiorythmContactButtonState();
}

class _CustomBiorythmContactButtonState extends State<CustomBiorythmContactButton> {
  double _padding=6;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: width/20),
      child: GestureDetector(
              onTapDown: (_)=>setState(() {
                _padding=0;
              }),
              onTapUp: (_)=>setState(() {
                _padding=6;
              }),
              onTap:widget.onTap,
              child: AnimatedContainer(
                width:width<AppConstants.maxTabletWidth?width: width*0.5,
                // height: 100,
                padding: EdgeInsets.only(bottom: _padding),
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                width:width<AppConstants.maxTabletWidth?width: width*0.5,
                // height: 100,
                  padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                                color: AppColors.lightPurple1,
                
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(widget.icon,color: AppColors.darkPrimary,size:width<AppConstants.maxMobileWidth? 40:70,),
                      
                      Text(widget.title,style: AppStyles.styleRufinaBold32(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 28:width<AppConstants.maxTabletWidth?40:46))),
                   const SizedBox()
                    ],
                  ),),
              ),
            ),
    )
;
  }
}