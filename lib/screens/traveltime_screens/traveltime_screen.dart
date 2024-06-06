import 'package:divinecontrol/models/traveltime_models/traveltime_model.dart';
import 'package:divinecontrol/screens/traveltime_screens/future_time_screen.dart';
import 'package:divinecontrol/screens/traveltime_screens/pastlif_prediction_screen.dart';
import 'package:divinecontrol/widgets/traveltime_widgets/custom_traveltime_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class TravelTimeScreen extends StatelessWidget {
  const TravelTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
       appBar: AppBar(
          title: Text(
            'Future Prediction',
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleBold24(context)
                    .copyWith(color: AppColors.darkPrimary)
                : AppStyles.styleBold24(context).copyWith(
                    color: AppColors.darkPrimary,
                    fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
          ),
          backgroundColor: AppColors.primary,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppImages.leftArrow),
          ),
        ),
        body:width<AppConstants.maxTabletWidth? getMobileTravelScreen(width, context):getDesktopTravelScreen(width, context),
    );
  }

  Padding getMobileTravelScreen(double width, BuildContext context) {
    return Padding(
        padding:width<AppConstants.maxMobileWidth? const EdgeInsets.symmetric(horizontal: 10,vertical: 20) :const EdgeInsets.symmetric(horizontal: 100,vertical: 100),
        child: Column(children: [
          CustomTravelTimeCard(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FutureTimeScreen()));
          }, travelTimeModel: TravelTimeModel(title: "Future Prediction", image: AppImages.futuretime)),  
      width<AppConstants.maxMobileWidth?  const SizedBox(height: 30,):const SizedBox(height: 50,),
         CustomTravelTimeCard(onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PastLifePredictionScreen()));
         }, travelTimeModel: TravelTimeModel(title: "Past Life Prediction", image: AppImages.pasttime))
        ],),
      );
  }

  Padding getDesktopTravelScreen(double width, BuildContext context) {
    return Padding(
        padding:EdgeInsets.symmetric(horizontal: 100,vertical: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          SizedBox(
            width: width*0.4,
            height: width*0.28,
            child: CustomTravelTimeCard(onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FutureTimeScreen()));
            }, travelTimeModel: TravelTimeModel(title: "Future Prediction", image: AppImages.futuretime)),
          ),  
         SizedBox(
          width: width*0.4,
          height: width*0.28,
           child: CustomTravelTimeCard(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PastLifePredictionScreen()));
           }, travelTimeModel: TravelTimeModel(title: "Past Life Prediction", image: AppImages.pasttime)),
         )
        ],),
      );
  }
 
}