import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';



class PickedPalemImageWidget extends StatelessWidget {
  const PickedPalemImageWidget({
    super.key, required this.image,
  });
   final Widget image;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return Container(

      width: width*0.5,
      height:width<AppConstants.maxMobileWidth? height*0.25:height*0.3 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: image
    );
  }
}