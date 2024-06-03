import 'package:divinecontrol/utils/tarot_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';


class LoginAndRegister extends StatelessWidget {
  const LoginAndRegister({
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
              alignment:width<600?Alignment.centerLeft: Alignment.topRight,
              content:const Text('Click to SignIn'),));
          },
          child: Text(
            'Login',
            style:width<TarotAppConstants.tabletMaxWidth? AppStyles.styleRegular28(context):AppStyles.styleRegular28(context).copyWith(fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 22))
          ),
        ),
        Text('/',style: width<TarotAppConstants.tabletMaxWidth? AppStyles.styleRegular26(context):AppStyles.styleRegular28(context),),
        InkWell(
          splashColor: AppColors.purple,
          onTap: (){
            showDialog(context: context, builder: (context)=> AlertDialog(
              alignment:width<600?Alignment.centerLeft: Alignment.topRight,
              content:const Text('Click to SignUp'),));
          },
          child: Text(
            'Register',
            style:width<TarotAppConstants.tabletMaxWidth? AppStyles.styleRegular28(context):AppStyles.styleRegular28(context).copyWith(fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 22))
          ),
        ),
      ],
    );
  }
}