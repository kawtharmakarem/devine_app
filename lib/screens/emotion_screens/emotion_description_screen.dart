import 'package:divinecontrol/models/emotion_models/emotion_model.dart';
import 'package:divinecontrol/screens/emotion_screens/emotion_screen.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/history_button.dart';
import 'package:divinecontrol/widgets/emotion_widgets/custom_checkbox.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class EmotionDescriptionScreen extends StatefulWidget {
  const EmotionDescriptionScreen({
    super.key,
    required this.emotionModel,
  });
  final EmotionModel emotionModel;

  @override
  State<EmotionDescriptionScreen> createState() =>
      _EmotionDescriptionScreenState();
}

class _EmotionDescriptionScreenState extends State<EmotionDescriptionScreen> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  @override
  void initState() {
    super.initState();
  }

  Widget buildSigleCheckBox(CheckBoxState checkBoxState) {
    return CheckboxListTile(
      value: checkBoxState.value,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.darkPrimary,
      onChanged: (value) {
        setState(() {
          checkBoxState.value = value!;
        });
      },
      title: Text(checkBoxState.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: widget.emotionModel.title, leading: false),
      body: width < AppConstants.maxMobileWidth
          ? getMobileDescription(width, context)
          : width < AppConstants.maxTabletWidth
              ? getTabletDescription(width, context)
              : getDesktopDescription(width, context),
    );
  }

  Column getMobileDescription(double width, BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            width: width * 0.6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.emotionModel.detailsImage,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress==null){
                    return child;
                  }else{
                    return CircularProgressIndicator(color: AppColors.darkPrimary,strokeCap: StrokeCap.round,);
                  }
                },
                fit: BoxFit.cover,
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Your request has been recieved.',
          style: AppStyles.styleSemiBold24(context).copyWith(
              color: AppColors.black,
              fontSize: getResponsiveFontSizeText(context, fontSize: 24)),
        ),
        const Divider(),
        Row(
          children: [
            Checkbox(
              value: isChecked1,
              onChanged: (val) {
                setState(() {
                  isChecked1 = val!;
                });
              },
            ),
            Container(
                width: width * 0.8,
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.emotionModel.title1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppStyles.styleRegular20(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 18)),
                ))
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked2,
              onChanged: (val) {
                setState(() {
                  isChecked2 = val!;
                });
              },
            ),
            Container(
                width: width * 0.8,
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.emotionModel.title2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppStyles.styleRegular20(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 18)),
                ))
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked3,
              onChanged: (val) {
                setState(() {
                  isChecked3 = val!;
                });
              },
            ),
            Container(
                width: width * 0.8,
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.emotionModel.title3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppStyles.styleRegular20(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 18)),
                ))
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked4,
              onChanged: (val) {
                setState(() {
                  isChecked4 = val!;
                });
              },
            ),
            Container(
                width: width * 0.8,
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.emotionModel.title4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppStyles.styleRegular20(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 18)),
                ))
          ],
        ),
        const Divider(),
        const SizedBox(
          height: 40,
        ),
        CustomButton(
            onPressed: () {
              Get.off(() => EmotionScreen(),
                  transition: Transition.circularReveal,
                  duration:
                      const Duration(seconds: AppConstants.durationSecond));
            },
            title: 'Cancel'),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Column getTabletDescription(double width, BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
            width: width * 0.6,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.emotionModel.detailsImage,
                loadingBuilder: (context, child, loadingProgress){
                  if(loadingProgress==null)
                  {
                    return child;
                  }else{
                    return CircularProgressIndicator(color: AppColors.darkPrimary,strokeCap: StrokeCap.round,);
                  }
                },
                fit: BoxFit.cover,
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Your request has been recieved.',
          style: AppStyles.styleSemiBold24(context).copyWith(
              color: AppColors.black,
              fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Transform.scale(
                scale: 2,
                child: Checkbox(
                  value: isChecked1,
                  onChanged: (val) {
                    setState(() {
                      isChecked1 = val!;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                  width: width * 0.8,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    widget.emotionModel.title1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyles.styleRegular20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 28)),
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Transform.scale(
                scale: 2,
                child: Checkbox(
                  value: isChecked2,
                  onChanged: (val) {
                    setState(() {
                      isChecked2 = val!;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                  width: width * 0.8,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    widget.emotionModel.title2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyles.styleRegular20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 28)),
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Transform.scale(
                scale: 2,
                child: Checkbox(
                  value: isChecked3,
                  onChanged: (val) {
                    setState(() {
                      isChecked3 = val!;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                  width: width * 0.8,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    widget.emotionModel.title3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyles.styleRegular20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 28)),
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Transform.scale(
                scale: 2,
                child: Checkbox(
                  value: isChecked4,
                  onChanged: (val) {
                    setState(() {
                      isChecked4 = val!;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                  width: width * 0.8,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    widget.emotionModel.title4,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyles.styleRegular20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 28)),
                  ))
            ],
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 40,
        ),
        CustomButton(
            onPressed: () {
              Get.off(() => EmotionScreen(),
                  transition: Transition.circularReveal,
                  duration:
                      const Duration(seconds: AppConstants.durationSecond));
            },
            title: 'Cancel'),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget getDesktopDescription(double width, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                width: width * 0.35,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.emotionModel.detailsImage,
                    loadingBuilder: (context, child, loadingProgress){
                      if(loadingProgress==null){
                        return child;
                      }else{
                        return CircularProgressIndicator(color: AppColors.darkPrimary,strokeCap: StrokeCap.round,);
                      }
                    },
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              // width: ,
              child: Text(
                'Your request has been recieved.',
                style: AppStyles.styleSemiBold24(context).copyWith(
                    color: AppColors.black,
                    fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 2,
                  child: Checkbox(
                    value: isChecked1,
                    onChanged: (val) {
                      setState(() {
                        isChecked1 = val!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    width: width * 0.8,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.emotionModel.title1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 30)),
                    ))
              ],
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 2,
                  child: Checkbox(
                    value: isChecked2,
                    onChanged: (val) {
                      setState(() {
                        isChecked2 = val!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    width: width * 0.8,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.emotionModel.title2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 30)),
                    ))
              ],
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 2,
                  child: Checkbox(
                    value: isChecked3,
                    onChanged: (val) {
                      setState(() {
                        isChecked3 = val!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    width: width * 0.8,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.emotionModel.title3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 30)),
                    ))
              ],
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 2,
                  child: Checkbox(
                    value: isChecked4,
                    onChanged: (val) {
                      setState(() {
                        isChecked4 = val!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    width: width * 0.8,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.emotionModel.title4,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 30)),
                    ))
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                onPressed: () {
                  Get.off(() => EmotionScreen(),
                      transition: Transition.zoom,
                      duration:
                          const Duration(seconds: AppConstants.durationSecond));
                },
                title: 'Cancel'),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
