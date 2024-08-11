
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

class BrowesDialog extends StatelessWidget {
  const BrowesDialog({super.key, required this.pickFromGallery, required this.pickFromCamera});

 final VoidCallback pickFromGallery;
  final VoidCallback pickFromCamera;

    

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      content: Stack(
        alignment: Alignment.center,

        children: [
          Container(
            width:width<AppConstants.maxMobileWidth? width:width<AppConstants.maxTabletWidth? width*0.8:width*0.4,
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.primary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Click To Pick Image",
                  style: AppStyles.styleRufinaBold32(context).copyWith(color: AppColors.white,
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 22:32)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                      width:width<AppConstants.maxTabletWidth? width*0.55:width*0.3,
                  child: ElevatedButton.icon(
                      onPressed: pickFromGallery,
                      icon: Icon(Icons.browse_gallery,color: AppColors.darkPrimary,size:width<AppConstants.maxMobileWidth? 30:50,),
                      label: Text(
                        "From Gallery",
                        style: AppStyles.styleRegular20(context).copyWith(color: AppColors.darkPrimary,
                          fontSize: getResponsiveFontSizeText(context, fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?20:width<AppConstants.maxTabletWidth? 24:28))
                        ))
                      ),
                ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width:width<AppConstants.maxTabletWidth? width*0.55:width*0.3,
                      child: ElevatedButton.icon(
                      onPressed: pickFromCamera,
                      icon: Icon(Icons.camera,color: AppColors.darkPrimary,size:width<AppConstants.maxMobileWidth? 30:50,),
                      label: Text(
                        "From Camera",
                        style: AppStyles.styleRegular20(context).copyWith(color: AppColors.darkPrimary,
                          fontSize: getResponsiveFontSizeText(context, fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?20:width<AppConstants.maxTabletWidth? 24:28))
                        ))
                      ),
                    )
              ],
            ),
          ),
                   

        ],
      ),
    );
  }
}
