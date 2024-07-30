
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/widgets/emotion_widgets/custom_3d_button.dart';
import 'package:flutter/material.dart';


class CustomContactUsEmotionButton extends StatefulWidget {
  const CustomContactUsEmotionButton(
      {super.key,
      required this.onTap, required this.title, required this.image });
  final void Function() onTap;
  final String title;
  final String image;

  @override
  State<CustomContactUsEmotionButton> createState() => _CustomContactUsEmotionButtonState();
}

class _CustomContactUsEmotionButtonState extends State<CustomContactUsEmotionButton> {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
 AnimatedContainer(
            duration: Duration(milliseconds: 300 + (10 * 150)),
          transform: Matrix4.translationValues(startAnimation ? 0 : width, 0, 0),
          curve: Curves.decelerate,
                  width:width*0.25,
                  child: Divider(color: AppColors.darkPrimary,endIndent: 10,indent: 10,thickness: 3,)),
                  Spacer(),
                  AnimatedContainer(
                     duration: Duration(milliseconds: 300 + (10 * 150)),
          transform: Matrix4.translationValues(startAnimation ? 0 : width, 0, 0),
          curve: Curves.decelerate,
                    child: Custom3DButton(onTap: widget.onTap, title: widget.title, image: widget.image)),
                    Spacer(),
         AnimatedContainer(
            duration: Duration(milliseconds: 300 + (10 * 150)),
          transform: Matrix4.translationValues(startAnimation ? 0 : width, 0, 0),
          curve: Curves.decelerate,
                  width:width*0.25,
                  child: Divider(color: AppColors.darkPrimary,endIndent: 10,indent: 10,thickness: 3,)),
                  Spacer()
      ],
    );
  }
}

