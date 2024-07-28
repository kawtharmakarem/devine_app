import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomAstrologyButton extends StatefulWidget {
  const CustomAstrologyButton(
      {super.key,
      required this.title,
      required this.onTap,

      this.color = Colors.white,
      this.textColor = Colors.black,this.iconData});
  final String title;
  final void Function() onTap;
  final Color color;
  final Color textColor;
  final IconData? iconData;

  @override
  State<CustomAstrologyButton> createState() => _CustomAstrologyButtonState();
}

class _CustomAstrologyButtonState extends State<CustomAstrologyButton> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return width<AppConstants.maxMobileWidth?getMobileButtonContent(width, context): getTabletButtonContent(width, context);
  }

  Widget getMobileButtonContent(double width, BuildContext context) {
    return GestureDetector(
    onTap: widget.onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: AppColors.black),
        color: widget.color,
      ),
      child:widget.iconData==null? Text(
        widget.title,
        style:AppStyles.styleBold24(context).copyWith(
            fontSize: getResponsiveFontSizeText(context, fontSize:14),
            color: widget.textColor)
      ):Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(widget.iconData,size:15,color: widget.textColor,),
         Text(
        widget.title,
        style:AppStyles.styleBold24(context).copyWith(
            fontSize: getResponsiveFontSizeText(context, fontSize:14),
            color: widget.textColor))
    
      ],),
    ),
      );
  }

  InkWell getTabletButtonContent(double width, BuildContext context) {
    return InkWell(
    splashColor: AppColors.primary,
    onTap: widget.onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: AppColors.black),
        color: widget.color,
      ),
      child: Text(
        widget.title,
        style:width<AppConstants.maxTabletWidth? AppStyles.styleBold24(context).copyWith(
            fontSize: getResponsiveFontSizeText(context, fontSize: 26),
            color: widget.textColor):AppStyles.styleBold32(context).copyWith(color: widget.textColor),
      ),
    ),
  );
  }
}
