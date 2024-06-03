import 'package:divinecontrol/models/astrology_models/astrology_cardmodel.dart';
import 'package:divinecontrol/screens/astrology_screens/astrology_description_screen.dart';
import 'package:divinecontrol/widgets/astrology_widgets/custom_astrology_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class AstrologyDetailsPage extends StatelessWidget {
  const AstrologyDetailsPage({super.key, required this.astrologyModel});
  final AstrologyModel astrologyModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          astrologyModel.title,
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
      body:width<AppConstants.maxTabletWidth? getMobileDetailsContent(width, context):getDesktopDetailsContent(width, context),
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
            width: width*0.7,
            child: Image.asset(astrologyModel.image,fit: BoxFit.fill,)),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width,
            child: Text(
              astrologyModel.description,softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 16,
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleRegular20(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 16))
                  : AppStyles.styleRegular20(context)
                      .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: 28)),
            ),
          ), //todo make scrollable
          Expanded(child: SizedBox()),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),

            child: CustomAstrologyButton(
              title: 'Book Now',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AstrologyDescriptionScreen(astrologyModel: astrologyModel)));
              },
              color: AppColors.black,
              textColor: AppColors.white,
            ),
          ),
          Expanded(child: SizedBox())
        ],
      ),
    );
  }

  Padding getDesktopDetailsContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         
          Column(
            children: [
              Container(
                width: width*0.4,
                child: Image.asset(astrologyModel.image,fit: BoxFit.fill,)),
                const SizedBox(height: 30,),
                Container(
                  width: width*0.4,
                  child: CustomAstrologyButton(title: 'Book Now', onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AstrologyDescriptionScreen(astrologyModel: astrologyModel)));
                  },color: AppColors.black,textColor: AppColors.white,))
            ],
          ),
         
          Container(
            width: width*0.5,
            child: Text(
              astrologyModel.description,
              style:AppStyles.styleRegular20(context)
                      .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
            ),
          ), //todo make scrollable
          
        ],
      ),
    );
  }
}
