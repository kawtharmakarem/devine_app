import 'dart:io';

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

  XFile? photo;
  Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    // Capture a photo
    final XFile? photo = await _picker.pickImage(source: source);
    setState(() {
      this.photo = photo;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: CustomAppBar(title: 'Palem Reading', leading: true),
        body: width < AppConstants.maxTabletWidth
            ? getMobileContent(width, context)
            : getDesktopContent(width, context));
  }

  Widget getMobileContent(double width, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
             margin: const EdgeInsets.all(20),
                width: width,
                // height: height,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                PickedPalemImageWidget(
                  image: photo == null
                      ? Image.asset(AppImages.scanpalem)
                      : Image(
                          image: FileImage(
                            File(photo!.path),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 30,
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
                          width: width < AppConstants.maxMobileWidth ? 500 : 500,
                          height: width < AppConstants.maxMobileWidth ? 150 : 200,
                          child: Image.asset(
                            AppImages.brows,
                            fit: BoxFit.fill,
                          )),
                      CustomPalemButton(
                        title: 'Browse',
                        onPressed: () async {
                          showDialog(
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
                                                  fontSize: getResponsiveFontSizeText(
                                                      context,
                                                      fontSize: 28)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        getMediaButton(context,
                                            icon: Icons.browse_gallery,
                                            title: "From Gallery",
                                            source: ImageSource.gallery,
                                            width: width),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        getMediaButton(context,
                                            icon: Icons.camera,
                                            title: "From Camera",
                                            source: ImageSource.camera,
                                            width: width)
                                      ],
                                    ),
                                  ));
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
            
            
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Or drag files here',
                        style: width < AppConstants.maxMobileWidth
                            ? AppStyles.styleRegular20(context).copyWith(
                                fontSize:
                                    getResponsiveFontSizeText(context, fontSize: 24))
                            : AppStyles.styleRegular20(context).copyWith(
                                fontSize:
                                    getResponsiveFontSizeText(context, fontSize: 32)),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  secondChild: Column(
                    children: [
                      PickedPalemImageWidget(image: Image.asset(AppImages.palemhand)),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomPalemButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const PalemReadingDetailsScreen()));
                          },
                          title: 'Scan '),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomPalemButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          title: 'Cancel'),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  crossFadeState:
                      !isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 300),
                ),
              ],
            ),
          ),
       CustomContactUsCard(image: AppImages.palemreadingLogo, horizontalPadding: 20,description: "Get Details Palm Reading for Holistic Insights.\nBook personalised call Now !")
        ],
      ),
    );
  }

  Widget getDesktopContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
                      image: photo == null
                          ? Image.asset(
                              AppImages.scanpalem,
                              fit: BoxFit.fill,
                            )
                          : Image(
                              image: FileImage(
                                File(
                                  photo!.path,
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
                              builder: (context) => AlertDialog(
                                    alignment:
                                        width < AppConstants.maxTabletWidth
                                            ? Alignment.center
                                            : Alignment.centerRight,
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Pick Image :',
                                          style: width <
                                                  AppConstants.maxMobileWidth
                                              ? AppStyles.styleBold24(context)
                                              : width <
                                                      AppConstants
                                                          .maxTabletWidth
                                                  ? AppStyles.styleBold24(
                                                          context)
                                                      .copyWith(
                                                          fontSize:
                                                              getResponsiveFontSizeText(
                                                                  context,
                                                                  fontSize: 28))
                                                  : AppStyles.styleBold24(
                                                          context)
                                                      .copyWith(
                                                          fontSize:
                                                              getResponsiveFontSizeText(
                                                                  context,
                                                                  fontSize:
                                                                      40)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        getMediaButton(context,
                                            icon: Icons.browse_gallery,
                                            title: "From Gallery",
                                            source: ImageSource.gallery,
                                            width: width),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        getMediaButton(context,
                                            icon: Icons.camera,
                                            title: "From Camera",
                                            source: ImageSource.camera,
                                            width: width)
                                      ],
                                    ),
                                  ));
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
      
      
                        
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Or drag files here',
                        style: width < AppConstants.maxMobileWidth
                            ? AppStyles.styleRegular20(context).copyWith(
                                fontSize: getResponsiveFontSizeText(context,
                                    fontSize: 24))
                            : AppStyles.styleRegular20(context).copyWith(
                                fontSize: getResponsiveFontSizeText(context,
                                    fontSize: 32)),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  secondChild: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: width * 0.2,
                          height: width * 0.15,
                          child: PickedPalemImageWidget(
                              image: Image.asset(
                            AppImages.palemhand,
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            CustomPalemButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const PalemReadingDetailsScreen()));
                                },
                                title: 'Scan '),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomPalemButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                title: 'Cancel'),
                            const SizedBox(
                              height: 20,
                            )
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
       CustomContactUsCard(image: AppImages.palemreadingLogo, horizontalPadding: 20,description: "Get Details Palm Reading for Holistic Insights.\nBook personalised call Now !")

        ],
      ),
    );
  }

  Widget getMediaButton(BuildContext context,
      {required IconData icon,
      required String title,
      required ImageSource source,
      required double width}) {
    return ElevatedButton.icon(
        onPressed: () async {
          await pickImage(source);
          Navigator.pop(context);
        },
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
