import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';



class PickedImageWidget extends StatelessWidget {
  const PickedImageWidget({
    super.key, required this.image,
  });
   final Widget image;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      width:width<AppConstants.maxTabletWidth? width*0.3:width*0.2,
      height:width<AppConstants.maxTabletWidth? width*0.3:width*0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: image
    );
  }
}