import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomMoreButton extends StatefulWidget {
  const CustomMoreButton({super.key, required this.title, required this.onTap, required this.icon});
  final String title;
  final void Function() onTap;
  final IconData icon;

  @override
  State<CustomMoreButton> createState() => _CustomMoreButtonState();
}

class _CustomMoreButtonState extends State<CustomMoreButton> {
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
                margin: EdgeInsets.only(right: 30),
                padding: EdgeInsets.only(bottom: _padding),
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  decoration: BoxDecoration(
                                color: AppColors.lightPurple1,
                
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(flex: 1,),
                      Icon(widget.icon,size: 40,color: AppColors.darkPrimary,),
                      Spacer(flex: 1,),
                      Text(widget.title,style: AppStyles.styleBold20(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize: 18))),
                   Spacer(flex: 2,)
                    ],
                  ),),
              ),
            ),
    )
;
  }
}