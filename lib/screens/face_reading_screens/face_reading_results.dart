import 'package:divinecontrol/widgets/face_reading_widgets/facereading_results_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/facereading_models/facereading_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class FaceReadingResults extends StatelessWidget {
  const FaceReadingResults({super.key});
   static final  List<FaceReadingResultsModel> _results=[
 const FaceReadingResultsModel(title: 'Personal Traits', image: AppImages.person,subTitle: "You are in a negative cycle for your physical attributes. Negative physical days find us needing more rest, and our immunity might not be at its best. Our sex drives are usually lower, and we may be prone to overexertion and overindulgence. Your strength, coordination, and well-being may not be at their highest, so it is a good opportunity to work on them!"),
   const FaceReadingResultsModel(title: 'Life Path And Purpose', image: AppImages.lifepath,subTitle: "You are in a positive cycle for your emotional attributes. On positive emotional days, we are in a good mood and get along easily with others. On very high positive days, we might be overly emotional, impulsive, and prone to outbursts. Take advantage of your enhanced sensitivity, mood, creativity, awareness and perception while they are at their peak."),
    const FaceReadingResultsModel(title: 'Relationship Compatibility', image: AppImages.relation,subTitle: "You are in a negative cycle for your intellectual attributes. On negative intellectual days, we might have a tough time trying to make decisions, be unable to concentrate, and have trouble communicating effectively with others. Your logical analysis, analytical thinking, alertness, memory and communication may not be at their highest, so it is a good opportunity to work on them"),
    const FaceReadingResultsModel(title: 'Growth and Development', image: AppImages.growth,subTitle: "You are in a negative cycle for your intellectual attributes. On negative intellectual days, we might have a tough time trying to make decisions, be unable to concentrate, and have trouble communicating effectively with others. Your logical analysis, analytical thinking, alertness, memory and communication may not be at their highest, so it is a good opportunity to work on them."),
   ];
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
        title: Text(
          'Face Results !',
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
      body:width<AppConstants.maxTabletWidth? getMobileFaceReadingResults(context,width):getDesktopFaceReadingResults(context, width),
    );
  }

  Padding getMobileFaceReadingResults(BuildContext context,double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
      child: ListView(
        shrinkWrap: true,
        children: [
          for(final result in _results)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            child: FaceReadingResultsCard(faceModel: result,onTap: (){
             // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FaceReadingResultCardDetails(resultModel: result)));
            },),
          )
          
          ],
      ),
    );
  }

  Padding getDesktopFaceReadingResults(BuildContext context,double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
      child: GridView(
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          
          crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 20,childAspectRatio: 3/2),
          
        shrinkWrap: true,
        children: [
          for(final result in _results)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            child: FaceReadingResultsCard(faceModel: result,onTap: (){
             // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FaceReadingResultCardDetails(resultModel: result)));
            },),
          )
          
          ],
      ),
    );
  }
}

