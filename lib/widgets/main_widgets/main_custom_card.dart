import 'package:divinecontrol/models/main_models/main_model.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class MainCustomCard extends StatefulWidget {
  const MainCustomCard({super.key, required this.isActive,required this.mainModel, required this.index});
    final bool isActive;
  final MainModel mainModel;
  final int index;

  @override
  State<MainCustomCard> createState() => _MainCustomCardState();
}

class _MainCustomCardState extends State<MainCustomCard> {
  bool startAnimation=false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      setState(() {
        startAnimation=true;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return widget.isActive
        ? AnimatedContainer(
          duration: Duration(milliseconds: 300+(150*widget.index)),
                transform: Matrix4.translationValues(startAnimation ? 0 : width, 0, 0),
                    curve: Curves.decelerate,

          child: Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: width/40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          
            child: Container(
                 padding:const EdgeInsets.only(left: 10,top: 5,bottom: 5),
              width: width,
              height: height*0.11,
              decoration: BoxDecoration(
                    color: AppColors.lightPurple2,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: AppColors.purple)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: width,
                        child: Text(widget.mainModel.title,softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 2,
                            style:width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize: 24)):AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(widget.mainModel.image))
                  ],
                ),
            ),
          ),
        )
        : AnimatedContainer(
          duration: Duration(milliseconds: 300+(150*widget.index)),
                transform: Matrix4.translationValues(startAnimation ? 0 : width, 0, 0),
                    curve: Curves.decelerate,
          child: Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: width/40),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
               width: width*0.9,
                height: height*0.09,
                 padding:const EdgeInsets.only(left: 10,top: 5,bottom: 5),
                decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: AppColors.purple)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: width,
                        child: Text(widget.mainModel.title,softWrap: true,maxLines: 2,overflow: TextOverflow.ellipsis,
                            style: width < AppConstants.maxMobileWidth
                                ? AppStyles.styleRegular20(context)
                                : AppStyles.styleRegular20(context).copyWith(
                                    fontSize: getResponsiveFontSizeText(context,
                                        fontSize: 28))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(widget.mainModel.image))
                  ],
                ),
            ),
          ),
        );
    
  }
}



// class MainCustomTitle extends StatelessWidget {
//   const MainCustomTitle(
//       {super.key, required this.drawerTitle, this.isActive = false});
//   final DrawerTitleModel drawerTitle;
//   final bool isActive;
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.sizeOf(context).width;
//     return isActive
//         ? GestureDetector(
//           onTap: drawerTitle.onTap,
//           child: Container(
//             padding: const EdgeInsets.all(5),
//             decoration: BoxDecoration(
//                   color: AppColors.lightPurple2,
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(width: 0.5, color: AppColors.purple)),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(drawerTitle.title,softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 2,
//                       style:width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context):AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28))),
//                   SvgPicture.asset(drawerTitle.image)
//                 ],
//               ),
//           ),
//         )
//         : Row(
//             children: [
//               Text(drawerTitle.title,softWrap: true,maxLines: 2,overflow: TextOverflow.ellipsis,
//                   style: width < AppConstants.maxMobileWidth
//                       ? AppStyles.styleRegular20(context)
//                       : AppStyles.styleRegular20(context).copyWith(
//                           fontSize: getResponsiveFontSizeText(context,
//                               fontSize: 28))),
//               SvgPicture.asset(drawerTitle.image)
//             ],
//           );
//   }
// }
