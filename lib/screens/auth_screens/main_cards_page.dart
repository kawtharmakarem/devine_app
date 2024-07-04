import 'package:divinecontrol/screens/auth_screens/glass_login.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';


class MainCardsPage extends StatefulWidget {
  const MainCardsPage({super.key});

  @override
  State<MainCardsPage> createState() => _MainCardsPageState();
}

class _MainCardsPageState extends State<MainCardsPage> {
  @override
  Widget build(BuildContext context) {
   // double width=MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        backgroundColor:AppColors.lightPurple1,
        // appBar:width<AppConstants.maxTabletWidth? AppBar(
        //   centerTitle: true,
        //   title: Text('Login Or Register',style: AppStyles.styleBold24(context).copyWith(color:AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?24:32)),
        //         ),
        // backgroundColor:AppColors.lightPurple1,
        // leading: SizedBox(
        //   width:width<AppConstants.maxMobileWidth? 30:50,
        //   child: Image.asset(AppImages.logoonly,fit: BoxFit.fill,),),
        // )
       // :null,
        body: Container(
          decoration:const BoxDecoration(
            color: AppColors.lightPurple1,
           
          ),
          child:const Center(
            child: GlassLogin(),
          ),
        ),
      ),
    );
  }
}