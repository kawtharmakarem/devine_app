
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../models/emotion_models/emotion_model.dart';

class CustomEmotionCard extends StatefulWidget {
  const CustomEmotionCard(
      {super.key,
      required this.index,
      required this.onTap,required this.emotionModel});
  final int index;
 final EmotionModel emotionModel;
  final void Function() onTap;

  @override
  State<CustomEmotionCard> createState() => _CustomEmotionCardState();
}

class _CustomEmotionCardState extends State<CustomEmotionCard> {
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
    return AnimatedContainer(
      width: width / 20,
      height: width / 15,
      // margin: EdgeInsets.only(bottom: width / 20),
      duration: Duration(milliseconds: 300 + (widget.index * 150)),
      transform: Matrix4.translationValues(startAnimation ? 0 : width, 0, 0),
      curve: Curves.decelerate,
      child: GestureDetector(
        onTap: widget.onTap,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1)
                ),
                  width: width < AppConstants.maxMobileWidth
                      ? width / 4
                      : width < AppConstants.maxTabletWidth
                          ? width / 6.5
                          : width / 10,
                  height: width < AppConstants.maxMobileWidth
                      ? width / 4
                      : width < AppConstants.maxTabletWidth
                          ? width / 6.5
                          : width / 10,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                       widget.emotionModel.image,
                             // "https://images.unsplash.com/photo-1609852234838-147db6815968?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    
                    fit: BoxFit.cover,
                    ),
                  )
                  //  Image.asset(
                  //   widget.emotionModel.image,
                  //   fit: BoxFit.cover,
                  // )
                  ),
                  const SizedBox(height: 5,),
                  Text('Rs.99',style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?20:24)),textAlign: TextAlign.center,),
              Text(
                widget.emotionModel.title,textAlign: TextAlign.center,
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 18))
                    : width < AppConstants.maxTabletWidth
                        ? AppStyles.styleBold24(context).copyWith(
                            fontSize:
                                getResponsiveFontSizeText(context, fontSize: 24))
                        : AppStyles.styleBold24(context).copyWith(
                            fontSize:
                                getResponsiveFontSizeText(context, fontSize: 32)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
