
import 'package:divinecontrol/screens/auth_screens/welcom_screen.dart';
import 'package:flutter/material.dart';
import '../../animation/staggered_raindrop_animation.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class HomePageDesktopLayout extends StatefulWidget {
  const HomePageDesktopLayout({super.key});

  @override
  State<HomePageDesktopLayout> createState() => _HomePageDesktopLayoutState();
}

class _HomePageDesktopLayoutState extends State<HomePageDesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return const Material(
        child: Stack(
      children: [
       WelcomeView(),
        
        IgnorePointer(child: AnimationScreen(color: AppColors.white)),
        
      ],
    ));
  }
}




class AnimationScreen extends StatefulWidget {
  const AnimationScreen({
   required this.color,super.key
  });

 final Color color;

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> with SingleTickerProviderStateMixin {
  Size size = Size.zero;
 late AnimationController _controller;
late  StaggeredRaindropAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
    
      vsync: this,
    );
    _animation = StaggeredRaindropAnimation(_controller,maximumDropSize: 600);
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    setState(() {
      size = MediaQuery.of(context).size;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: HolePainter(
               color: widget.color,
               opacity: 0,
              holeSize: _animation.holeSize.value * size.width
            )
          )
        ),
        Positioned(
         top: size.height/12,
          //top: _animation.dropPosition.value * size.height,
          left: size.width / 2 - _animation.dropSize.value / 2,
          child: SizedBox(
            width: _animation.dropSize.value,
            height: _animation.dropSize.value,
            child: CustomPaint(
              painter: DropPainter(
                
                visible: _animation.dropVisible.value
              ),
              child:_animation.dropVisible.value? Image.asset(AppImages.logoonly,fit: BoxFit.cover,):Container(),
          )
          )
        ),
        Padding(
          padding: EdgeInsets.only(bottom: size.height*0.05),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: _animation.textOpacity.value,
              child: Text(
                'Divine Connection',
                style: AppStyles.styleRufinaBold32(context).copyWith(color: AppColors.darkPrimary).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 60))
              )
            )
          )
        )
      ]
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}



class DropPainter extends CustomPainter {
  DropPainter({
    this.visible = true
  });

  bool visible;

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible) {
      return;
    }
   
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class HolePainter extends CustomPainter {
  HolePainter({
     required this.color,
    required this.holeSize,
    required this.opacity
  });

   Color color;
  double holeSize;
  double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = holeSize / 2;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Rect outerCircleRect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius);
    Rect innerCircleRect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius / 2);

    Path transparentHole = Path.combine(
      PathOperation.difference,
      Path()..addRect(
          rect
      ),
      Path()
        ..addOval(outerCircleRect)
        ..close(),
    );

    Path halfTransparentRing = Path.combine(
      PathOperation.difference,
      Path()
        ..addOval(outerCircleRect)
        ..close(),
      Path()
        ..addOval(innerCircleRect)
        ..close(),
    );

    canvas.drawPath(transparentHole, Paint()..color = color);
    canvas.drawPath(halfTransparentRing, Paint()..color = color.withOpacity(opacity),);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}