import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPdfButton extends StatefulWidget {
  const CustomPdfButton({super.key, required this.title, required this.onTap});
  final String title;
  final void Function() onTap;

  @override
  State<CustomPdfButton> createState() => _CustomPdfButtonState();
}

class _CustomPdfButtonState extends State<CustomPdfButton> {
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
                padding: EdgeInsets.only(bottom: _padding),
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                                color: AppColors.lightPurple1,
                
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     const Icon(FontAwesomeIcons.filePdf,size: 40,color: AppColors.darkPrimary,),
                      Text(widget.title,style: AppStyles.styleRufinaBold32(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize: 24))),
                    ],
                  ),),
              ),
            ),
    )
;
  }
}