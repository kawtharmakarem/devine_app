import 'package:divinecontrol/models/biorhythm_models/biorhythm_description_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class BiorhythmDescription extends StatelessWidget {
  final BiorhythmDescriptionModel descriptionModel;

  const BiorhythmDescription({super.key, required this.descriptionModel, this.onTap});
 final void Function()? onTap;
  

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
                SizedBox(
                  width:width<AppConstants.maxMobileWidth? width*0.2:width<AppConstants.maxTabletWidth? width*0.2:width*0.1,
                  child: Image.asset(descriptionModel.image,fit: BoxFit.fill,)),
                const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                ListView(
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
