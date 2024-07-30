import 'package:divinecontrol/models/emotion_models/emotion_model.dart';
import 'package:divinecontrol/screens/emotion_screens/emotion_description_screen.dart';
import 'package:divinecontrol/screens/emotion_screens/emotion_screen.dart';
import 'package:divinecontrol/widgets/astrology_widgets/custom_astrology_button.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class EmotionDetailsPage extends StatelessWidget {
  const EmotionDetailsPage({super.key, required this.emotionModel});
  final EmotionModel emotionModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: emotionModel.title, leading: false,actions: Icons.close,actionesFn: (){
        Get.offAll(()=>EmotionScreen());
      },),
      body: width < AppConstants.maxTabletWidth
          ? getMobileDetailsContent(width, context)
          : getDesktopDetailsContent(width, context),
    );
  }

  Padding getMobileDetailsContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: width * 0.7,
              child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  emotionModel.detailsImage,
                  loadingBuilder: (context,child,progress){
                    if(progress==null){
                      return child;
                    }else{
                      return CircularProgressIndicator(color: AppColors.darkPrimary,);
                    }
                  },
                
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            height: 10,
          ),
                          Text('Rs.99',style: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?20:24)),textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
             SizedBox(
            width: width*0.6,
            child: Transform.scale(
              scale: 1.3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: CustomAstrologyButton(
                  title: 'Book Now',
                  onTap: () {
                    
                    Get.off(()=>EmotionDescriptionScreen(emotionModel: emotionModel),transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
                  },
                  color: AppColors.black,
                  textColor: AppColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView(
              children: [
                Text(
                  emotionModel.description,
                  style: width < AppConstants.maxMobileWidth
                      ? AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 18))
                      : AppStyles.styleRegular20(context).copyWith(
                          color: AppColors.black,
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 28)),
                ),
              ],
            ),
          ), //todo make scrollable
         
        ],
      ),
    );
  }

  Padding getDesktopDetailsContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      emotionModel.detailsImage,
                      loadingBuilder: (context, child, loadingProgress){
                        if(loadingProgress==null){
                          return child;
                        }else{
                          return CircularProgressIndicator(color: AppColors.darkPrimary,);
                        }
                      },
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: width * 0.4,
                  child: CustomAstrologyButton(
                    title: 'Book Now',
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => EmotionDescriptionScreen(
                      //         emotionModel: emotionModel)));
                                          Get.off(()=>EmotionDescriptionScreen(emotionModel: emotionModel),transition: Transition.zoom,duration: const Duration(seconds: AppConstants.durationSecond));

                    },
                    color: AppColors.black,
                    textColor: AppColors.white,
                  ))
            ],
          ),

          Container(
            width: width * 0.5,
            child: Expanded(
              child: ListView(
                children: [
                  Text(
                    emotionModel.description,
                    style: AppStyles.styleRegular20(context).copyWith(
                        color: AppColors.black,
                        fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
                  ),
                ],
              ),
            ),
          ), //todo make scrollable
        ],
      ),
    );
  }
}
