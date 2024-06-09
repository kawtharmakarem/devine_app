import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.onTap,
      required this.title,
      required this.image});
  final void Function() onTap;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    
    if(width<AppConstants.maxMobileWidth){
      return getMobileCard(width, height, context);
    }else if(width<AppConstants.maxTabletWidth){
      return getTabletCard(width, height, context);
    }else{
      return getDesktopCard(width, height, context);
    }
  }

  Card getMobileCard(double width, double height, BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.primary,
        child: Container(
          width: width * 0.45,
          height: height * 0.26,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8)
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(image),
              Text(
                title,textAlign: TextAlign.center,
                style: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 22)),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }

  Card getTabletCard(double width, double height, BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.primary,
        child: Container(
          width: width * 0.45,
          height: height * 0.25,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8)
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  width: width * 0.255, //  200,
                  height: height * 0.155, // 200,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  )),
              Text(
                title,
                style: AppStyles.styleBold24(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }


  Card getDesktopCard(double width, double height, BuildContext context) {
    return Card(
      margin:const EdgeInsets.all(20),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.primary,
        child: Container(
          width: width * 0.25,
         height: height*0.5,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8)
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                 width: width * 0.25, 
                  height: height * 0.3, 
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  )),
              Text(
                title,textAlign: TextAlign.center,
                style: AppStyles.styleBold24(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
