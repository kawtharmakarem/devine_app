import 'package:divinecontrol/models/biorhythm_models/biorhythm_description_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class BiorhythmDescription extends StatelessWidget {
  final BiorhythmDescriptionModel descriptionModel;

  const BiorhythmDescription({super.key, required this.descriptionModel, this.onTap, this.value});
 final void Function()? onTap;
 final int? value;
  

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            color: AppColors.white,
            child: Column(
              
            
              children: [
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                                     descriptionModel.title,
                                     style: width < AppConstants.maxMobileWidth
                        ? AppStyles.styleBold24(context).copyWith(
                            fontSize:
                                getResponsiveFontSizeText(context, fontSize: 22))
                        : AppStyles.styleBold24(context).copyWith(
                            fontSize:
                                getResponsiveFontSizeText(context, fontSize: 32)),
                                   ),
                                   Text("/value : ${value}",style: AppStyles.styleRegular20(context).copyWith(color: AppColors.darkPrimary,fontWeight: FontWeight.w600,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth?20:28)),)
                   ],
                 ),
                SizedBox(
                  width:width<AppConstants.maxMobileWidth? width*0.15:width<AppConstants.maxTabletWidth? width*0.2:width*0.09,
                  child: Image.asset(descriptionModel.image,fit: BoxFit.fill,)),
                const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                ListView(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  shrinkWrap: true,
                  children: [
                    Text(
                      descriptionModel.description,
                      // overflow: TextOverflow.ellipsis,
                      // maxLines: 5,
                      style: width < AppConstants.maxMobileWidth
                          ? AppStyles.styleRegular20(context)
                          : width < AppConstants.maxTabletWidth
                              ? AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 24))
                              : AppStyles.styleRegular20(context).copyWith(
                                  fontSize: getResponsiveFontSizeText(context,
                                      fontSize: 28)),
                    ),
                  ],
                )
              ],
            )

           
            ),
      ),
    );
    
   
  }
}
