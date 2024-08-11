import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return AlertDialog(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      contentPadding: EdgeInsets.only(top: 10),
      content: Stack(
        children: [
          Container(
            width:width<AppConstants.maxTabletWidth? width:width*0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppStyles.styleRufinaBold32(context).copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: width < AppConstants.maxMobileWidth
                                  ? 28
                                  : 32)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 5,
                ),
                Divider(
                  
                  color: Colors.grey,
                  height: 4,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                    child: Text(
                      'OK',
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.darkPrimary,
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: width < AppConstants.maxMobileWidth
                                  ? 24
                                  : 32)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: width < AppConstants.maxMobileWidth ? 0 : 10,
              right: width < AppConstants.maxMobileWidth ? 0 : 10,
              child: Transform.scale(
                scale: width < AppConstants.maxMobileWidth ? 1 : 2,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  backgroundColor: AppColors.white,
                  mini: true,
                  elevation: 5,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.darkPrimary,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
