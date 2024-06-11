import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomKundleResultCard extends StatelessWidget {
  const CustomKundleResultCard({
    super.key, required this.title, required this.details,
    
  });
 final String title;
 final String details;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width < AppConstants.maxMobileWidth
        ? getMobileKundleDetailsCard(context, width)
        : width<AppConstants.maxTabletWidth? getTabletKundleDetailsCard(context, width):getDesktopKundleDetailsCard(context, width);
  }

  Padding getMobileKundleDetailsCard(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child:
      Container(
        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
          ),
          
        ),
        child: Column(
          children: [
            Align(
             alignment: Alignment.center,
             child: Text(title,
                 style: AppStyles.styleBold24(context).copyWith(
                     fontSize: getResponsiveFontSizeText(context,
                         fontSize: 24))),
                          ),
              const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text(details,
                          
                          style: AppStyles.styleRegular18(context).copyWith(
                              fontSize: getResponsiveFontSizeTextTarot(context,
                                  fontSize: 30),
                              color: AppColors.black)),
                    ],
                  ),
                )
              
              
          ],
        ),
      )
     

      
    );

    
  }

  Padding getTabletKundleDetailsCard(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child:
       Container(
        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
          ),
          
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title,textAlign: TextAlign.center,
                style: AppStyles.styleBold20(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context,
                        fontSize: 30))),
              const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                
                Expanded(
                  child: ListView(
                    children: [
                      Text(details,
                          // softWrap: true,
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 11,
                          style: AppStyles.styleRegular18(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 30),
                              color: AppColors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 10,)
              
              
          ],
        ),
             )
     
    );
  }

  Padding getDesktopKundleDetailsCard(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child:
       Container(
        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
          ),
          
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title,textAlign: TextAlign.center,
                style: AppStyles.styleBold20(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context,
                        fontSize: 32))),
              const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                
                Expanded(
                  child: ListView(
                    children: [
                      Text(details,
                          // softWrap: true,
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 11,
                          style: AppStyles.styleRegular18(context).copyWith(
                              fontSize: getResponsiveFontSizeTextTarot(context,
                                  fontSize: 20),
                              color: AppColors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 10,)
              
              
          ],
        ),
      )
      
    );
  }
}
