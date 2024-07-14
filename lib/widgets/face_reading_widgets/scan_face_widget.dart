
import 'package:divinecontrol/models/facereading_models/facereading_card_model.dart';
import 'package:divinecontrol/screens/face_reading_screens/face_reading_results.dart';
import 'package:divinecontrol/screens/face_reading_screens/facereading_card_details.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'custom_facereading_card.dart';
import 'custom_scan_button.dart';
import 'picked_image_widget.dart';

class ScanFaceWidget extends StatefulWidget {
  const ScanFaceWidget({super.key});

  @override
  State<ScanFaceWidget> createState() => _ScanFaceWidgetState();
}

class _ScanFaceWidgetState extends State<ScanFaceWidget> {
  bool isVisible = false;
  // XFile? photo;
  // Future<XFile?> pickImage(ImageSource source) async {
  //   final ImagePicker _picker = ImagePicker();
  //   // Capture a photo
  //   final XFile? photo = await _picker.pickImage(source: source);
  //   setState(() {
  //     this.photo = photo;
  //   });
  // }
     static final  List<FaceReadingCardModel> _cards=[
      FaceReadingCardModel(title: "Time Magic", image: AppImages.magictime, description: "Time Magic Description"),
      FaceReadingCardModel(title: "Know Your Past", image: AppImages.past, description: "Know Your Past Description"),
      FaceReadingCardModel(title: "Baby", image: AppImages.baby, description: "Baby Description"),

     ];


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width<AppConstants.maxTabletWidth? getMobileFaceReading(context, width):getDesktopFaceReading(context, width);
  }

  Padding getMobileFaceReading(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
           padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: PickedImageWidget(
                          image: Image.asset(
                        AppImages.facescan,
                      )),
                    ),
          
                    SizedBox(
                      height: width*0.4,
                      child:const VerticalDivider(
                          color: AppColors.black,
                          thickness: 1,
                          indent: 25,
                          endIndent: 25),
                    ),
                    width<AppConstants.maxMobileWidth?Container():const SizedBox(width: 30,),
                    Expanded(
                      child: AnimatedCrossFade(
                        firstChild: Column(
                         // mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AppImages.brows),
                            CustomScanButton(
                              title: 'Browse',
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                            Text(
                              'Or drag files here',
                              style: AppStyles.styleRegular20(context),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        secondChild: Column(
                          children: [
                            PickedImageWidget(
                                image: Image.asset(AppImages.profileImage)),
                            CustomScanButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const FaceReadingResults()));
                                },
                                title: 'Scan '),
                                const SizedBox(height: 5,),
                            CustomScanButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                title: 'Cancel'),
                          ],
                        ),
                        crossFadeState: !isVisible
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: ListView(
            shrinkWrap: true,
            
           // physics: NeverScrollableScrollPhysics(),
            children: [
              for(final cardModel in _cards)
              Container(margin: const EdgeInsets.only(bottom: 10),
                child: CustomFaceReadingCard(onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FaceReadingCardDetails(cardModel: cardModel)));
                }, cardModel: cardModel))
            ],
          ))
          
        ],
      ),
    );
  }

  
  Padding getDesktopFaceReading(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PickedImageWidget(
                    image: Image.asset(
                  AppImages.facescan
                )),
            
                const SizedBox(
                  height: 200,
                  child:VerticalDivider(
                      color: AppColors.black,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10),
                ),
                AnimatedCrossFade(
                  firstChild: Column(
                    children: [
                      Image.asset(AppImages.brows),
                      CustomScanButton(
                        title: 'Browse',
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        'Or drag files here',
                        style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  secondChild:Row(
                    children: [
                      PickedImageWidget(
                          image: Image.asset(AppImages.profileImage)),
                          const SizedBox(width: 50,),
                      Column(
                        children: [
                          CustomScanButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const FaceReadingResults()));
                              },
                              title: 'Scan '),
                              const SizedBox(height: 20,),
                          CustomScanButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              title: 'Cancel'),
                        ],
                      ),
                    ],
                  ),
                  crossFadeState: !isVisible
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 300),
                ),
                
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
         Expanded(child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20,mainAxisSpacing: 20),
            shrinkWrap: true,
            
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for(final cardModel in _cards)
              Container(margin: const EdgeInsets.only(bottom: 10),
                child: CustomFaceReadingCard(onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FaceReadingCardDetails(cardModel: cardModel)));
                }, cardModel: cardModel))
            ],
          ))
        ],
      ),
    );
  }

}



 // PickedImageWidget(
                    //   image: photo == null
                    //       ? Image.asset(
                    //           AppImages.facescan,
                    //         )
                    //       : Image(
                    //           image: FileImage(
                    //             File(photo!.path),
                    //           ),
                    //         ),
                    // ),