import 'dart:io';

import 'package:divinecontrol/models/facereading_models/facereading_card_model.dart';
import 'package:divinecontrol/screens/face_reading_screens/face_reading_results.dart';
import 'package:divinecontrol/screens/face_reading_screens/facereading_card_details.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:divinecontrol/widgets/auth_widgets/custom_contactus_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'custom_facereading_card.dart';
import 'custom_scan_button.dart';
import 'picked_image_widget.dart';

class ScanFaceWidget extends StatefulWidget {
  const ScanFaceWidget({super.key});

  @override
  State<ScanFaceWidget> createState() => _ScanFaceWidgetState();
}

class _ScanFaceWidgetState extends State<ScanFaceWidget> {
  // String fileName = "";
  // String _pathText = "";
  bool isVisible = false;
  // dynamic imageFile = AssetImage("assets/images/book.jpg");
  // XFile? photo;
  // Future<XFile?> pickImage(ImageSource source) async {
  //   final ImagePicker _picker = ImagePicker();
  //   // Capture a photo
  //   final XFile? photo = await _picker.pickImage(source: source);
  //   setState(() {
  //     this.photo = photo;
  //   });
  //   return null;
  // }

  File? _image;
  List<Face> faces = [];
  late FaceDetector faceDetector;
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() {
        _image = File(image.path); //convert image to file bby using its path
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future _detectFaces(File img) async {
    final options = FaceDetectorOptions(
        enableContours: true, enableLandmarks: true, enableTracking: true);
    //final faceDetector = FaceDetector(options: options);
     faceDetector = FaceDetector(options: options);
    final inputImage = InputImage.fromFilePath(img.path);
    faces = await faceDetector.processImage(inputImage);
    setState(() {});
    print(faces.length);
  }

  static final List<FaceReadingCardModel> _cards = [
    FaceReadingCardModel(
        title: "Time Magic",
        image: AppImages.magictime,
        description: "Time Magic Description"),
    // FaceReadingCardModel(
    //     title: "Know Your Past",
    //     image: AppImages.past,
    //     description: "Know Your Past Description"),
    // FaceReadingCardModel(
    //     title: "Baby", image: AppImages.baby, description: "Baby Description"),
  ];

@override
void dispose() {
  faceDetector.close();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width < AppConstants.maxTabletWidth
        ? getMobileFaceReading(context, width)
        : getDesktopFaceReading(context, width);
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: PickedImageWidget(
                        image: Image.asset(AppImages.facescan),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.6,
                      child: const VerticalDivider(
                          color: AppColors.black,
                          thickness: 1,
                          indent: 25,
                          endIndent: 25),
                    ),
                    width < AppConstants.maxMobileWidth
                        ? Container()
                        : const SizedBox(
                            width: 30,
                          ),
                    Expanded(
                      child: AnimatedCrossFade(
                        firstChild: Column(
                          children: [
                            Image.asset(AppImages.brows),
                            CustomScanButton(
                              title: 'Capture',
                              onPressed: () async {
                                showMediaDialog(context, width);
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // Text(
                            //   'OR',
                            //   style: AppStyles.styleRufinaBold32(context)
                            //       .copyWith(
                            //           fontSize: getResponsiveFontSizeText(
                            //               context,
                            //               fontSize: 20)),
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // CustomScanButton(
                            //     onPressed: () async {
                            //       final result = await FilePicker.platform
                            //           .pickFiles(allowMultiple: false);
                            //       if (result == null) return;
                            //       _pathText =
                            //           result.files.first.path.toString();
                            //       fileName = result.files.first.name;
                            //       imageFile = FileImage(File(_pathText));
                            //       setState(() {
                            //         isVisible = !isVisible;
                            //       });
                            //     },
                            //     title: "Choose File"),
                          ],
                        ),
                        secondChild: Column(
                          children: [
                            PickedImageWidget(
                              image: _image == null
                                  ? Image.asset(AppImages.profileImage)
                                  : SizedBox(
                                      width: width * 0.2,
                                      height: 50,

                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.cover,
                                      )),
                            ),
                            CustomScanButton(
                                onPressed: () {
                                  if(faces.length>0){
                                    Get.to(()=>FaceReadingResults(),transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
                                  }else{
                                    showDialog(context: context, builder:(context)=>AlertDialog(content: Text('No detected Faces To Scan',style: AppStyles.styleRegular20(context),),));
                                  }
                                 
                                },
                                title: 'Scan '),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'OR',
                            //       style: AppStyles.styleRufinaBold32(context)
                            //           .copyWith(
                            //               fontSize: getResponsiveFontSizeText(
                            //                   context,
                            //                   fontSize: 20)),
                            //     ),
                            //     CustomScanButton(
                            //         onPressed: () async {
                            //           final result = await FilePicker.platform
                            //               .pickFiles(allowMultiple: false);
                            //           if (result == null) return;
                            //           _pathText =
                            //               result.files.first.path.toString();
                            //           fileName = result.files.first.name;
                            //           imageFile = FileImage(File(_pathText));
                            //           setState(() {});
                            //         },
                            //         title: "Choose File\n${fileName==""?"no file chosen": fileName}"),
                            //   ],
                            // ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomScanButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                    // imageFile=AssetImage(AppImages.profileImage);
                                    _image=null;
                                  });
                                },
                                title: 'Cancel'),
                            faces.length == 0
                                ? Text(
                                    'No Faces detected',
                                    style: AppStyles.styleRegular20(context)
                                        .copyWith(
                                            color: AppColors.red,
                                            fontSize: getResponsiveFontSizeText(
                                                context,
                                                fontSize: 16)),
                                  )
                                : SizedBox()
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
          Expanded(
              child: ListView(

            children: [
              // for (final cardModel in _cards)
              //   Container(
              //       margin: const EdgeInsets.only(bottom: 10),
              //       child: CustomFaceReadingCard(
              //           onTap: () {
              //             Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (context) => FaceReadingCardDetails(
              //                     cardModel: cardModel)));
              //           },
              //           cardModel: cardModel))
              ...List.generate(_cards.length, (index) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: CustomFaceReadingCard(onTap: (){
                  Get.to(()=>FaceReadingCardDetails(cardModel: _cards[index]),transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
                }, cardModel: _cards[index]),
              )),
              CustomContactUsCard(iconData: Icons.face_2_sharp, horizontalPadding: 0,description: 'Unlock Your Inner Beauty with Face Analysis.\nBook personalised call Now !')
            ],
          ))
        ],
      ),
    );
  }

  Future<dynamic> showMediaDialog(BuildContext context, double width) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pick Image :',
                    style: width < AppConstants.maxMobileWidth
                        ? AppStyles.styleBold24(context)
                        : AppStyles.styleBold24(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 28)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  getMediaButton(context,
                      icon: Icons.browse_gallery,
                      title: "From Gallery",
                      source: ImageSource.gallery,
                      width: width, onPressed: () async {
                    _pickImage(ImageSource.gallery).then((value) {
                      if (_image != null) {
                        _detectFaces(_image!);
                      }
                    });
                    Navigator.pop(context);
                    
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  getMediaButton(context,
                      icon: Icons.camera,
                      title: "From Camera",
                      source: ImageSource.camera,
                      width: width, onPressed: () async {
                    _pickImage(ImageSource.camera).then((value) {
                      if (_image != null) {
                        _detectFaces(_image!);
                      }
                    });
                  Navigator.pop(context);

                  })
                ],
              ),
            ));
  }

  Padding getDesktopFaceReading(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
                PickedImageWidget(image: Image.asset(AppImages.facescan)),
                const SizedBox(
                  height: 200,
                  child: VerticalDivider(
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
                        title: 'Capture',
                        onPressed: () async {
                          showMediaDialog(context, width);
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'OR',
                        style: AppStyles.styleRufinaBold32(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 20)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // CustomScanButton(
                      //     onPressed: () async {
                      //       setState(() {
                      //         isVisible = !isVisible;
                      //       });
                      //       final result = await FilePicker.platform
                      //           .pickFiles(allowMultiple: false);
                      //       if (result == null) return;
                      //       _pathText =
                      //           result.files.first.path.toString();
                      //       fileName = result.files.first.name;
                      //       imageFile = FileImage(File(_pathText));

                      //     },
                      //     title: "Choose File"),
                    ],
                  ),
                  secondChild: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PickedImageWidget(
                          image: Image.asset(AppImages.profileImage)),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          CustomScanButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const FaceReadingResults()));
                              },
                              title: 'Scan '),
                          // CustomScanButton(
                          //           title: 'Capture',
                          //           onPressed: () async {
                          //             showMediaDialog(context, width);
                          //             setState(() {
                          //               fileName="";
                          //               // isVisible = !isVisible;
                          //             });
                          //           },
                          //         ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'no file chosen',
                            style: AppStyles.styleRufinaBold32(context)
                                .copyWith(
                                    fontSize: getResponsiveFontSizeText(context,
                                        fontSize: 20)),
                          ),
                          //  CustomScanButton(
                          //     onPressed: () async {
                          //       final result = await FilePicker.platform
                          //           .pickFiles(allowMultiple: false);
                          //       if (result == null) return;
                          //       _pathText =
                          //           result.files.first.path.toString();
                          //       fileName = result.files.first.name;
                          //       imageFile = FileImage(File(_pathText));
                          //       setState(() {});
                          //     },
                          //     title: "Choose File\n${fileName==""?"no file chosen": fileName}"),
                          const SizedBox(
                            height: 5,
                          ),
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
          Expanded(
              child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
            // shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(),
            children: [
             


                         ...List.generate(_cards.length, (index) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: CustomFaceReadingCard(onTap: (){
                  Get.to(()=>FaceReadingCardDetails(cardModel: _cards[index]),transition: Transition.zoom,duration: const Duration(seconds: AppConstants.durationSecond));
                }, cardModel: _cards[index]),
              )),
              CustomContactUsCard(image: AppImages.facelogo, horizontalPadding: 0,description: 'Unlock Your Inner Beauty with Face Analysis.\nBook personalised call Now !')
            ],
          ))
        ],
      ),
    );
  }

  Widget getMediaButton(BuildContext context,
      {required IconData icon,
      required String title,
      required ImageSource source,
      required double width,
      required VoidCallback onPressed}) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          title,
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleRegular20(context)
                  .copyWith(color: AppColors.darkPrimary)
              : width < AppConstants.maxTabletWidth
                  ? width < AppConstants.maxTabletWidth
                      ? AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 28))
                      : AppStyles.styleRegular20(context)
                  : AppStyles.styleRegular20(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 32)),
        ));
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