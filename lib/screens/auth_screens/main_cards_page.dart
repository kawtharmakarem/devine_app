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