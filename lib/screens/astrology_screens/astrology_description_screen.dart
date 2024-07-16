import 'package:divinecontrol/models/astrology_models/astrology_cardmodel.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class AstrologyDescriptionScreen extends StatefulWidget {
  const AstrologyDescriptionScreen({super.key, required this.astrologyModel});
  final AstrologyModel astrologyModel;

  @override
  State<AstrologyDescriptionScreen> createState() =>
      _AstrologyDescriptionScreenState();
}

class _AstrologyDescriptionScreenState
    extends State<AstrologyDescriptionScreen> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(title:widget.astrologyModel.title, leading: true),
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
        SizedBox(
            width: width * 0.6,
            child: Image.asset(widget.astrologyModel.image)),
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
                  widget.astrologyModel.title1,
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
                  widget.astrologyModel.title2,
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
                  widget.astrologyModel.title3,
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
                  widget.astrologyModel.title4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppStyles.styleRegular20(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 18)),
                ))
          ],
        ),
        const Divider()
      ],
    );
  }

  Column getTabletDescription(double width, BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            width: width * 0.6,
            child: Image.asset(
              widget.astrologyModel.image,
              fit: BoxFit.fill,
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
                    widget.astrologyModel.title1,
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
                    widget.astrologyModel.title2,
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
                    widget.astrologyModel.title3,
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
                    widget.astrologyModel.title4,
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
      const  Divider()
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
            SizedBox(
                width: width * 0.35,
                child: Image.asset(
                  widget.astrologyModel.image,
                  fit: BoxFit.fill,
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
         const   Divider(),
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
                    padding:const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.astrologyModel.title1,
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
                    padding:const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.astrologyModel.title2,
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
                    padding:const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.astrologyModel.title3,
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
                    padding:const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.astrologyModel.title4,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 30)),
                    ))
              ],
            ),
          const  Divider()
          ],
        ),
      ),
    );
  }
}
