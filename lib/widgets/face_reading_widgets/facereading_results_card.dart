import 'package:divinecontrol/models/facereading_models/facereading_model.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class FaceReadingResultsCard extends StatelessWidget {
  const FaceReadingResultsCard(
      {super.key, required this.faceModel, required this.onTap});
  final FaceReadingResultsModel faceModel;
  final void Function() onTap;

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
                faceModel.title,
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 22))
                    : AppStyles.styleBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32)),
              ),
              children: [
                Image.asset(faceModel.image),
                const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: Text(
                    faceModel.subTitle,
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
