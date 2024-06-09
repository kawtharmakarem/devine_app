import 'package:divinecontrol/models/numerlogy_models/numerology_details_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomNumerologyDetailsCard extends StatelessWidget {
  const CustomNumerologyDetailsCard({
    super.key,
    required this.detailsModel,
  });
  final NumerologyDetailsModel detailsModel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width < AppConstants.maxMobileWidth
        ? getMobileNumerologyDetailsCard(context, width)
        : width<AppConstants.maxTabletWidth? getTabletNumerologyDetailsCard(context, width):getDesktopNumerologyDetailsCard(context, width);
  }

  Padding getMobileNumerologyDetailsCard(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child:
      Container(
        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
          ),
          
        ),
        child: Column(
          children: [
            Container(
               child: Align(
                alignment: Alignment.center,
                child: Text(detailsModel.title,
                    style: AppStyles.styleBold24(context).copyWith(
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize: 24))),
              ),
           ),
              const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                
                Expanded(
                  child: ListView(
                    children: [
                      Text(detailsModel.details,
                          // softWrap: true,
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 11,
                          style: AppStyles.styleRegular18(context).copyWith(
                              fontSize: getResponsiveFontSizeTextTarot(context,
                                  fontSize: 30),
                              color: AppColors.black)),
                    ],
                  ),
                )
              
              
          ],
        ),
      )
      //  Card(
      //   elevation: 4,
      //   clipBehavior: Clip.hardEdge,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   child:
      //    Container(
      //       color: AppColors.white,
      //       child: ExpansionTile(
      //         childrenPadding:const EdgeInsets.only(left: 10,right: 5),
      //         initiallyExpanded: true,
      //         title: Align(
      //           alignment: Alignment.center,
      //           child: Text(detailsModel.title,
      //               style: AppStyles.styleBold24(context).copyWith(
      //                   fontSize: getResponsiveFontSizeText(context,
      //                       fontSize: 20))),
      //         ),
      //         children: [
      //           const Divider(
      //             color: AppColors.black,
      //             indent: 20,
      //             endIndent: 20,
      //           ),
                
      //           Text(detailsModel.details,
      //               // softWrap: true,
      //               // overflow: TextOverflow.ellipsis,
      //               // maxLines: 11,
      //               style: AppStyles.styleRegular18(context).copyWith(
      //                   fontSize: getResponsiveFontSizeTextTarot(context,
      //                       fontSize: 28),
      //                   color: AppColors.black))
      //         ],
      //       )),
      //        ),


      
    );

    
  }

  Padding getTabletNumerologyDetailsCard(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child:
       Container(
        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
          ),
          
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
               child: Text(detailsModel.title,textAlign: TextAlign.center,
                   style: AppStyles.styleBold20(context).copyWith(
                       fontSize: getResponsiveFontSizeText(context,
                           fontSize: 30))),
           ),
              const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                
                Expanded(
                  child: ListView(
                    children: [
                      Text(detailsModel.details,
                          // softWrap: true,
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 11,
                          style: AppStyles.styleRegular18(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 30),
                              color: AppColors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 10,)
              
              
          ],
        ),
             )
      //  Card(
      //   elevation: 4,
      //   clipBehavior: Clip.hardEdge,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   child: Container(
      //       color: AppColors.white,
      //       child: ExpansionTile(
              
      //        // clipBehavior: Clip.hardEdge,
      //        // dense: true,
      //         initiallyExpanded: true,
      //         title: Center(
      //           child: Text(detailsModel.title,
      //               style: AppStyles.styleBold24(context).copyWith(
      //                   fontSize:
      //                       getResponsiveFontSizeText(context, fontSize: 32))),
      //         ),
      //         children: [
      //           const Divider(
      //             color: AppColors.black,
      //             indent: 20,
      //             endIndent: 20,
      //           ),
      //           Container(
      //             padding: const EdgeInsets.only(left: 10, right: 10),
      //             child: Text(detailsModel.details,
      //                 softWrap: true,
      //                 overflow: TextOverflow.ellipsis,
      //                 maxLines: 13,
      //                 style:
      //                     AppStyles.styleRegular18(context).copyWith(
      //                         fontSize: getResponsiveFontSizeText(context,
      //                             fontSize: 28),
      //                         color: AppColors.black)
                          
      //                         )
      //                         ),
                
      //         ],
      //       )),
      // ),
    );
  }

  Padding getDesktopNumerologyDetailsCard(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child:
       Container(
        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
          ),
          
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
               child: Text(detailsModel.title,textAlign: TextAlign.center,
                   style: AppStyles.styleBold20(context).copyWith(
                       fontSize: getResponsiveFontSizeText(context,
                           fontSize: 32))),
           ),
              const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                
                Expanded(
                  child: ListView(
                    children: [
                      Text(detailsModel.details,
                          // softWrap: true,
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 11,
                          style: AppStyles.styleRegular18(context).copyWith(
                              fontSize: getResponsiveFontSizeTextTarot(context,
                                  fontSize: 20),
                              color: AppColors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 10,)
              
              
          ],
        ),
      )
      
    );
  }
}
