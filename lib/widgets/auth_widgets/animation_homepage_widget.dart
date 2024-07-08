// 

import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';



class MyAnimationClipPath extends AnimatedWidget {
  final Animation<double> animation;

  const MyAnimationClipPath(this.animation,{super.key}):super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return width<AppConstants.maxTabletWidth?  getMobileWaves(context,width):getDesktopWaves(width,height);
  }

  Column getMobileWaves(BuildContext context,double width) {
    return Column(
      children: [
        Expanded(child: Stack(children: [
          
          // Positioned(
          //   bottom:110,//sin(animation.value*12)+130,
          //   left:10,// cos(animation.value*6) ,
            
          //   child: SizedBox(
          //     width: width*0.4,
          //     child: Image.asset(AppImages.companyLogo,fit: BoxFit.fill,))
          //   ),
          Positioned(
            bottom: 0,
            right: animation.value,
            child: ClipPath(
              clipper: MyBottomWaveClipper(),
              child: Opacity(opacity: 0.5,
              child: Container(color: AppColors.darkPrimary,
              height: 200,
              width:width<AppConstants.maxMobileWidth?1000:width<AppConstants.maxTabletWidth?2000: 3000,//1000
              ),),
            )),

             Positioned(
            bottom: 0,
            left: animation.value,
            child: ClipPath(
              clipper: MyBottomWaveClipper(),
              child: Opacity(opacity: 0.5,
              child: Container(color: AppColors.darkPrimary,
              height:200,
              width:width<AppConstants.maxMobileWidth?1000:width<AppConstants.maxTabletWidth? 2000:3000,//1000
              ),),
            )),

        ],
          
        ))
      ],
  
  );
  }


   Column getDesktopWaves(double width,double height) {
    return Column(
      children: [
        Expanded(child: Stack(children: [
          
          Positioned(
           // bottom: cos(animation.value*100)+100,
           // left:sin(animation.value*50) ,
           bottom:height*0.3 ,
           left: 20,
            
            child:  SizedBox(
                    width: width * 0.3,
                    child: Image.asset(
                      AppImages.companyLogo,
                      fit: BoxFit.fill,
                    )),
            // Image.asset(AppImages.logoonly)
            ),
          Positioned(
            bottom: 0,
            right: animation.value,
            child: ClipPath(
              clipper: MyBottomWaveClipper(),
              child: Opacity(opacity: 0.5,
              child: Container(color: AppColors.darkPrimary,
              height: 200,
              width:width<AppConstants.maxMobileWidth?1000:width<AppConstants.maxTabletWidth?2000: 3000,//1000
              ),),
            )),

             Positioned(
            bottom: 0,
            left: animation.value,
            child: ClipPath(
              clipper: MyBottomWaveClipper(),
              child: Opacity(opacity: 0.5,
              child: Container(color: AppColors.darkPrimary,
              height:200,
              width:width<AppConstants.maxMobileWidth?1000:width<AppConstants.maxTabletWidth? 2000:3000,//1000
              ),),
            )),

        ],
          
        ))
      ],
  
  );
  }
}

class MyBottomWaveClipper  extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    var path=Path();
    path.lineTo(0.0, 40.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width,size.height);
    path.lineTo(size.width, 40.0);
    for(int i=0;i<10;i++) {
      if(i%2==0){
      path.quadraticBezierTo(
        size.width-(size.width/16)-(i*size.width/8),
       0.0,
        size.width-((i+1)*size.width/8),
         size.height-160
         );
    }else{
      path.quadraticBezierTo(
        size.width-(size.width/16)-(i*size.width/8),
       size.height-120,
        size.width-((i+1)*size.width/8),
         size.height-160
        );
    }
    }
    path.lineTo(0.0, 40.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

}

class MyAnimationWidget extends StatefulWidget {
  const MyAnimationWidget({super.key});

  @override
  State<MyAnimationWidget> createState() => _MyAnimationWidgetState();
}

class _MyAnimationWidgetState extends State<MyAnimationWidget>  with SingleTickerProviderStateMixin{
  
 late Animation<double> animation1;
 late Animation<double> animation;
 late AnimationController _controller;
 @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,
    duration:const Duration(seconds: 3),
    )..repeat();
   animation1=Tween<double>(begin: -500,end: 0).animate(_controller);
    animation=Tween<double>(begin: -1000,end: 0).animate(_controller);
  }
  @override
  void dispose() {
        _controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.sizeOf(context).width<AppConstants.maxTabletWidth){
         return MyAnimationClipPath(animation1,);

    }else{
      return MyAnimationClipPath(animation);
    }

  }
}