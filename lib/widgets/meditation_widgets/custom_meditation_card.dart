// import 'package:divinecontrol/models/meditation_models/meditation_models.dart';
// import 'package:divinecontrol/utils/app_constants.dart';
// import 'package:flutter/material.dart';

// import '../../utils/app_colors.dart';
// import '../../utils/app_styles.dart';

// class CustomMeditationCard extends StatelessWidget {
//   const CustomMeditationCard({
//     super.key,
//     required this.onTap,
//     required this.meditationModel,
//   });
//   final void Function() onTap;
//   final MeditationModel meditationModel;
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.sizeOf(context).width;
//     double height = MediaQuery.sizeOf(context).height;
//     return InkWell(
//       splashColor: AppColors.lightPurple1,
//       onTap: onTap,
//       child: width<AppConstants.maxTabletWidth?  getMobileCard(width, height, context):getDesktopCard(width, height, context),
//     );
//   }

//   Container getMobileCard(double width, double height, BuildContext context) {
//     return Container(
//       width: width * 0.45,
//       height:
//           width < AppConstants.maxMobileWidth ? height * 0.28 : height * 0.32,
//       decoration: ShapeDecoration(
//           color: AppColors.white,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20))),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const SizedBox(
//             height: 5,
//           ),
//           SizedBox(
//               width: width * 0.3,
//               child: Image.asset(
//                 meditationModel.image,
//                 fit: BoxFit.fill,
//               )),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Text(
//               meditationModel.title,
//               textAlign: TextAlign.center,
//               style: width < AppConstants.maxMobileWidth
//                   ? AppStyles.styleBold24(context).copyWith(
//                       fontSize:
//                           getResponsiveFontSizeText(context, fontSize: 18))
//                   : AppStyles.styleBold24(context).copyWith(
//                       fontSize:
//                           getResponsiveFontSizeText(context, fontSize: 30)),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Container getDesktopCard(double width, double height, BuildContext context) {
//     return Container(
//       width: width*0.3,
//       height: height*0.5,
//       decoration: ShapeDecoration(
//           color: AppColors.white,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20))),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
          
//           SizedBox(
//             width: width*0.2,
//             child: Image.asset(
//               meditationModel.image,fit: BoxFit.fill,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Text(
//               meditationModel.title,
//               textAlign: TextAlign.center,
//               style: AppStyles.styleBold24(context).copyWith(
//                       fontSize:
//                           getResponsiveFontSizeText(context, fontSize: 32)),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:divinecontrol/models/meditation_models/meditation_models.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomMeditationCard extends StatefulWidget {
  const CustomMeditationCard(
      {super.key,
      required this.index,
      required this.onTap, required this.meditationModel, });
  final int index;
 final MeditationModel meditationModel;
  final void Function() onTap;

  @override
  State<CustomMeditationCard> createState() => _CustomMeditationCardState();
}

class _CustomMeditationCardState extends State<CustomMeditationCard> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 1)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(widget.meditationModel.image,
fit: BoxFit.cover,),
                )
                // Image.asset(
                //   widget.meditationModel.image,
                //   fit: BoxFit.cover,
                // )
                ),
                const SizedBox(height: 5,),
            Text(
              widget.meditationModel.title,textAlign: TextAlign.center,
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 18))
                  : width < AppConstants.maxTabletWidth
                      ? AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 22))
                      : AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 32)),
            )
          ],
        ),
      ),
    );
  }
}