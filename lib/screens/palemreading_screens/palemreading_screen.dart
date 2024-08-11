import 'dart:io';
import 'package:divinecontrol/widgets/palemreading_widgets/custom_alert_dialog.dart';
import 'package:divinecontrol/widgets/palemreading_widgets/custom_browes_alert.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:divinecontrol/screens/palemreading_screens/palemreading_details_screen.dart';
import 'package:divinecontrol/widgets/auth_widgets/custom_contactus_card.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/palemreading_widgets/custom_image_widget.dart';
import 'package:divinecontrol/widgets/palemreading_widgets/custom_palem_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class PalemReadingScreen extends StatefulWidget {
  const PalemReadingScreen({super.key});

  @override
  State<PalemReadingScreen> createState() => _PalemReadingScreenState();
}

class _PalemReadingScreenState extends State<PalemReadingScreen> {
  bool isVisible = false;
  File? _image;
  bool _isPalmDetected = false;
  final ImagePicker _picker = ImagePicker();
  final ImageLabeler _imageLabeler = GoogleVision.instance.imageLabeler();
  int palmFoundCount = 0;
  bool processing = false;
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        detectPalm();
      });
    }
  }

  Future<void> detectPalm() async {
    setState(() {
      palmFoundCount = 0;
      _isPalmDetected = false;
      processing = true;
    });
    if (_image == null) return;
    debugPrint("image path: ${_image!.path}");

    detect(
      image: _image!,
      detectInImage: _getDetectionMethod(),
      // imageRotation: description.sensorOrientation,
      imageRotation: 0,
    ).then(
      (dynamic results) {
        debugPrint("result list :$results");
        for (var element in results as List<ImageLabel>) {
          debugPrint("result list element :${element.text}");
          //// you can use 'eyelash' for eye detection.
          if (element.text!.toLowerCase() == 'hand' &&
              element.confidence! > 0.75) {
            palmFoundCount = palmFoundCount + 1;
            if (palmFoundCount == 1) {
              _isPalmDetected = true;
            }
          }
        }
        setState(() {
          processing = false;
        });
      },
    );
  }

  @override
  void dispose() {
    _imageLabeler.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: AppColors.lightPurple1,
        appBar: CustomAppBar(title: 'Palem Reading', leading: true),
        body: width < AppConstants.maxTabletWidth
            ? getMobileContent(width, context)
            : getDesktopContent(width, context));
  }

  static Future<dynamic> detect({
    required File image,
    required Future<dynamic> Function(GoogleVisionImage image) detectInImage,
    required int imageRotation,
  }) async {
    // var imageByte = await image.readAsBytes();
    // var meteData= await _buildMetaData(image, ImageRotation.rotation0);
    return detectInImage(
      GoogleVisionImage.fromFile(image),
    );
  }

  // static Future<GoogleVisionImageMetadata> _buildMetaData(
  //     File image,
  //     ImageRotation rotation,
  //     ) async{
  //   var decodedImage = await decodeImageFromList(image.readAsBytesSync());
  //   return GoogleVisionImageMetadata(
  //     // rawFormat: image.,
  //     size: Size(decodedImage.width.toDouble(), decodedImage.height.toDouble()),
  //     rotation: rotation,

  //   );
  // }

  Future<dynamic> Function(GoogleVisionImage image) _getDetectionMethod() {
    return _imageLabeler.processImage;
  }

  Widget getMobileContent(double width, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                PickedPalemImageWidget(
                    image: Image.asset(
                  AppImages.scanpalem,
                  fit: BoxFit.fill,
                )),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: AppColors.black,
                  endIndent: 20,
                  indent: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedCrossFade(
                  firstChild: Column(
                    children: [
                      SizedBox(
                          width:
                              width < AppConstants.maxMobileWidth ? 500 : 500,
                          height:
                              width < AppConstants.maxMobileWidth ? 150 : 200,
                          child: Image.asset(
                            AppImages.brows,
                            fit: BoxFit.fill,
                          )),
                      CustomPalemButton(
                        title: 'Browse',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => BrowesDialog(
                                    pickFromCamera: () {
                                      pickImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    pickFromGallery: () {
                                      pickImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                  ));
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  secondChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      PickedPalemImageWidget(
                          image: _image == null
                              ? Image.asset(
                                  AppImages.palemhand,
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                )),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomPalemButton(
                          onPressed: () {
                            _isPalmDetected
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const PalemReadingDetailsScreen()))
                                : showDialog(
                                    context: context,
                                    builder: (context) => CustomAlertDialog(
                                        title:
                                            "No Palm is detected\nPlease try again later!"));
                          },
                          title: 'Scan '),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomPalemButton(
                          onPressed: () {
                            setState(() {
                              _image = null;
                              _isPalmDetected=false;
                              isVisible = !isVisible;
                            });
                          },
                          title: 'Cancel'),
                      const SizedBox(
                        height: 5,
                      ),
                      //   Text(
                      //  _image==null?   'No Image Selected':"",
                      processing
                          ? const Text(
                              "Image is processing",
                              style: TextStyle(fontSize: 20),
                            )
                          : Text(
                              _isPalmDetected
                                  ? 'Palm Detected!'
                                  : 'No Palm Detected.',
                              textAlign: TextAlign.center,
                              style: AppStyles.styleRegular20(context).copyWith(
                                  color: _isPalmDetected
                                      ? Colors.blue
                                      : Colors.red,
                                  fontSize: getResponsiveFontSizeText(context,
                                      fontSize:
                                          width < AppConstants.maxMobileWidth
                                              ? 20
                                              : 28))),
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
          CustomContactUsCard(
              image: AppImages.palemreadingLogo,
              horizontalPadding: 20,
              description:
                  "Get Details Palm Reading for Holistic Insights.\nBook personalised call Now !")
        ],
      ),
    );
  }

  Widget getDesktopContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                SizedBox(
                  width: width * 0.25,
                  height: width * 0.25,
                  child: PickedPalemImageWidget(
                      image: _image == null
                          ? Image.asset(
                              AppImages.scanpalem,
                              fit: BoxFit.fill,
                            )
                          : Image(
                              image: FileImage(
                                File(
                                  _image!.path,
                                ),
                              ),
                              fit: BoxFit.fill,
                            )),
                ),
                const SizedBox(
                  height: 400,
                  child: VerticalDivider(
                      color: AppColors.black,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10),
                ),
                const SizedBox(
                  width: 50,
                ),
                AnimatedCrossFade(
                  firstChild: Column(
                    children: [
                      SizedBox(
                          width: 500,
                          height: 200,
                          child: Image.asset(
                            AppImages.brows,
                            fit: BoxFit.fill,
                          )),
                      CustomPalemButton(
                        title: 'Browse',
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  BrowesDialog(pickFromGallery: () {
                                    pickImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  }, pickFromCamera: () {
                                    pickImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  }));
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  secondChild: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: width * 0.3,
                          height: width * 0.2,
                          child: PickedPalemImageWidget(
                              image: Image.asset(
                            AppImages.palemhand,
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            CustomPalemButton(
                                onPressed: () {
                                  _isPalmDetected
                                      ? Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PalemReadingDetailsScreen()))
                                      : showDialog(
                                          context: context,
                                          builder: (context) => CustomAlertDialog(
                                              title:
                                                  "No Palm is detected\n Please try again later!"));
                                },
                                title: 'Scan '),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomPalemButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                    _image = null;
                                  });
                                },
                                title: 'Cancel'),
                            const SizedBox(
                              height: 20,
                            ),
                            processing
                                ? const Text(
                                    "Image is processing",
                                    style: TextStyle(fontSize: 20),
                                  )
                                : Text(
                                    _isPalmDetected
                                        ? 'Palm is Detected!'
                                        : 'No Palm is Detected.',
                                    style: AppStyles.styleRegular20(context)
                                        .copyWith(
                                            color: _isPalmDetected
                                                ? Colors.blue
                                                : Colors.red,
                                            fontSize: getResponsiveFontSizeText(
                                                context,
                                                fontSize: 32))),
                          ],
                        ),
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
          // CustomContactUsCard(image: AppImages.palemreadingLogo, horizontalPadding: 20,description: "Get Details Palm Reading for Holistic Insights.\nBook personalised call Now !")
        ],
      ),
    );
  }

  // Widget getMediaButton(BuildContext context,
  //     {required IconData icon,
  //     required String title,
  //     required ImageSource source,
  //     required double width}) {
  //   return ElevatedButton.icon(
  //       onPressed: () {
  //         pickImage(source);
  //         Navigator.pop(context);
  //       },
  //       icon: Icon(icon),
  //       label: Text(
  //         title,
  //         style: width < AppConstants.maxMobileWidth
  //             ? AppStyles.styleRegular20(context)
  //                 .copyWith(color: AppColors.darkPrimary)
  //             : width < AppConstants.maxTabletWidth
  //                 ? width < AppConstants.maxTabletWidth
  //                     ? AppStyles.styleRegular20(context).copyWith(
  //                         fontSize:
  //                             getResponsiveFontSizeText(context, fontSize: 28))
  //                     : AppStyles.styleRegular20(context)
  //                 : AppStyles.styleRegular20(context).copyWith(
  //                     fontSize:
  //                         getResponsiveFontSizeText(context, fontSize: 32)),
  //       ));
  // }
}


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_ml_vision/google_ml_vision.dart';
// import 'package:image_picker/image_picker.dart';
// class PalmDetectionScreen3 extends StatefulWidget {
//   const PalmDetectionScreen3({super.key});

//   @override
//   PalmDetectionScreen3State createState() => PalmDetectionScreen3State();
// }

// class PalmDetectionScreen3State extends State<PalmDetectionScreen3> {
//   File? _image;
//   bool _isPalmDetected = false;
//   final ImagePicker _picker = ImagePicker();
//   final ImageLabeler _imageLabeler = GoogleVision.instance.imageLabeler();
//   int palmFoundCount = 0;
//   bool processing = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//         detectPalm();
//       });
//     }
//   }



//   Future<void> detectPalm() async {
//     setState(() {
//       palmFoundCount=0;
//       _isPalmDetected=false;
//       processing=true;
//     });
//     if (_image == null) return;
//     debugPrint("image path: ${_image!.path}");

//     detect(
//       image: _image!,
//       detectInImage: _getDetectionMethod(),
//       // imageRotation: description.sensorOrientation,
//       imageRotation:0,
//     ).then(
//           (dynamic results) {
//             debugPrint("result list :$results");
//         for (var element in results as List<ImageLabel>) {
//           debugPrint("result list element :${element.text}");
//           //// you can use 'eyelash' for eye detection.
//           if (element.text!.toLowerCase() == 'hand' &&
//               element.confidence! > 0.75) {
//             palmFoundCount = palmFoundCount + 1;
//             if (palmFoundCount == 1) {
//               _isPalmDetected=true;
//             }
//           }
//         }
//           setState(() {
//             processing=false;
//           });

//           },
//     );
//   }

//   @override
//   void dispose() {
//     _imageLabeler.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Palm Detection with ML Kit'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? const Text('No image selected.')
//                 : SizedBox(
//               height: 300,
//                 child: Image.file(_image!)),
//             const SizedBox(height: 20),
//             processing?
//                 const Text("Image is processing",style: TextStyle(fontSize: 20),)
//                 :
//             Text(_isPalmDetected ? 'Palm Detected!' : 'No Palm Detected.',
//               style: TextStyle(
//                 fontSize:20,
//                 color: _isPalmDetected?Colors.blue:Colors.red
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => pickImage(ImageSource.camera),
//               child: const Text('Pick Image from Camera'),
//             ),
//             ElevatedButton(
//               onPressed: () => pickImage(ImageSource.gallery),
//               child: const Text('Pick Image from Gallery'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }


//   static Future<dynamic> detect({
//     required File image,
//     required Future<dynamic> Function(GoogleVisionImage image) detectInImage,
//     required int imageRotation,
//   }) async {
//     var imageByte = await image.readAsBytes();
//     var meteData= await _buildMetaData(image, ImageRotation.rotation0);
//     return detectInImage(
//       GoogleVisionImage.fromFile(image),
//     );
//   }

//   static Future<GoogleVisionImageMetadata> _buildMetaData(
//       File image,
//       ImageRotation rotation,
//       ) async{
//     var decodedImage = await decodeImageFromList(image.readAsBytesSync());
//     return GoogleVisionImageMetadata(
//       // rawFormat: image.,
//       size: Size(decodedImage.width.toDouble(), decodedImage.height.toDouble()),
//       rotation: rotation,
//      
//     );
//   }

//   Future<dynamic> Function(GoogleVisionImage image) _getDetectionMethod() {
//     return _imageLabeler.processImage;
//   }
// }













