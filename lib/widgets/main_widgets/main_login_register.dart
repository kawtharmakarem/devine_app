import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';


class MainLoginAndRegister extends StatelessWidget {
  const MainLoginAndRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        InkWell(
          splashColor: AppColors.purple,
          onTap: (){
            showDialog(context: context, builder: (context)=> AlertDialog(
              alignment:width<AppConstants.maxMobileWidth?Alignment.centerLeft: Alignment.topRight,
              content:const Text('Click to SignIn'),));
          },
          child: Text(
            'Login',
            style:width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context):AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 28))
          ),
        ),
        Text('/',style: width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context):AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),),
        InkWell(
          splashColor: AppColors.purple,
          onTap: (){
            showDialog(context: context, builder: (context)=> AlertDialog(
              alignment:width<AppConstants.maxMobileWidth?Alignment.centerLeft: Alignment.topRight,
              content:const Text('Click to SignUp'),));
          },
          child: Text(
            'Register',
            style:width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context):AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 28))
          ),
        ),
      ],
    );
  }
}