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
            child: ExpansionTile(
              initiallyExpanded: true,
              
              title: Text(
                descriptionModel.title,
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 22))
                    : AppStyles.styleBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32)),
              ),
              children: [
                Image.asset(descriptionModel.image),
                const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: Text(
                    descriptionModel.description,
                    // overflow: TextOverflow.ellipsis,
                    // maxLines: 5,
                    style: width < AppConstants.maxMobileWidth
                        ? AppStyles.styleRegular18(context).copyWith(
                            fontSize: getResponsiveFontSizeTextTarot(context,
                                fontSize: 24),
                            color: AppColors.black)
                        : width < AppConstants.maxTabletWidth
                            ? AppStyles.styleRegular20(context)
                            : AppStyles.styleRegular20(context).copyWith(
                                fontSize: getResponsiveFontSizeText(context,
                                    fontSize: 24)),
                  ),
                )
              ],
            )

           
            ),
      ),
    );
    
   
  }
}
