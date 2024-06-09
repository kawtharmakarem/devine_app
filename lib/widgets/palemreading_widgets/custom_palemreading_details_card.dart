import 'package:divinecontrol/models/palemreading_models/palemreading_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomPalemReadingDetailsCard extends StatelessWidget {
  const CustomPalemReadingDetailsCard({
    super.key,
    required this.palemReadingModel,
  });
  final PalemReadingModel palemReadingModel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return width < AppConstants.maxMobileWidth
        ? getMobilePalemReadingDetailsCard(context, width,height)
        : width < AppConstants.maxTabletWidth
            ? getTabletPalemReadingDetailsCard(context, width,height)
            : getDesktopPalemReadingDetailsCard(context, width,height);
  }

  Padding getMobilePalemReadingDetailsCard(BuildContext context, double width,double height) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(palemReadingModel.title,
                      style: AppStyles.styleBold24(context).copyWith(
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: 24))),
                ),
              ),
              SizedBox(
                width: 75,
                height: 65,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right:0 ,
                      left: 0,
                      child: Image.asset(palemReadingModel.image)),
                    Positioned(

                      top: 25,
                      left: 0,
                      right: 0,
                      child:palemReadingModel.addtionImage==null?const SizedBox(): Image.asset(palemReadingModel.addtionImage!)
                          
                        
                    )
                  ],
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
                    Text(palemReadingModel.description,
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
       
        );
  }

  Padding getTabletPalemReadingDetailsCard(BuildContext context, double width,double height) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Container(
          height:height*0.3 ,
          padding:const EdgeInsets.symmetric(horizontal: 20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(palemReadingModel.title,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 40))),

              ),
               SizedBox(
                width: 105,
                height: 95,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right:0 ,
                      left: 0,
                      child: Image.asset(palemReadingModel.image)),
                    Positioned(

                      top: 25,
                      left: 0,
                      right: 0,
                      child:palemReadingModel.addtionImage==null?const SizedBox(): Image.asset(palemReadingModel.addtionImage!)
                          
                        
                    )
                  ],
                ),),
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(palemReadingModel.description,
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
              const SizedBox(
                height: 10,
              )
            ],
          ),
        )
       
        );
  }

  Padding getDesktopPalemReadingDetailsCard(
      BuildContext context, double width,double height) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(palemReadingModel.title,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32))),
              ),
              SizedBox(
                width: 95,
                height: 85,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right:0 ,
                      left: 0,
                      child: Image.asset(palemReadingModel.image)),
                    Positioned(

                      top: 25,
                      left: 0,
                      right: 0,
                      child:palemReadingModel.addtionImage==null?const SizedBox(): Image.asset(palemReadingModel.addtionImage!)
                          
                        
                    )
                  ],
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
                    Text(palemReadingModel.description,
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
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
