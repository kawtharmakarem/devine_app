import 'dart:developer';

import 'package:divinecontrol/models/horoscope_models/horoscope_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomHoroscopeDetailsCard extends StatefulWidget {
  const CustomHoroscopeDetailsCard({
    super.key,
    required this.horoscopeModel,
  });
  final HoroscopeModel horoscopeModel;

  @override
  State<CustomHoroscopeDetailsCard> createState() =>
      _CustomHoroscopeDetailsCardState();
  static _CustomHoroscopeDetailsCardState? of(BuildContext context) =>
      context.findAncestorStateOfType<_CustomHoroscopeDetailsCardState>();
}

class _CustomHoroscopeDetailsCardState
    extends State<CustomHoroscopeDetailsCard> {
  int _index = 0;
  set index(int index) => setState(() {
        _index = index;
      });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    log(_index.toString());
    return width < AppConstants.maxMobileWidth
        ? getMobileHoroscopeDetailsCard(context, width)
        : width < AppConstants.maxTabletWidth
            ? getTabletHoroscopeDetailsCard(context, width)
            : getDesktopHoroscopeDetailsCard(context, width);
  }

  Padding getMobileHoroscopeDetailsCard(BuildContext context, double width) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20, vertical: 10),
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
              SizedBox(
                  width: width / 5,
                  height: width / 5,
                  child: Image.asset(
                    widget.horoscopeModel.image,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomTHoroscopeToggleButton(
                index: _index,
                callBack: (value) {
                  setState(() {
                    _index = value;
                  });
                  return _index;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                        _index == 0
                            ? widget.horoscopeModel.yesterdayDes
                            : _index == 1
                                ? widget.horoscopeModel.todayDes
                                : widget.horoscopeModel.tomorrowDes,
                        style: AppStyles.styleRegular20(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 22),
                            color: AppColors.black)),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Padding getTabletHoroscopeDetailsCard(BuildContext context, double width) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              SizedBox(
                  width: width / 5,
                  height: width / 5,
                  child: Image.asset(
                    widget.horoscopeModel.image,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomTHoroscopeToggleButton(
                index: _index,
                callBack: (value) {
                  setState(() {
                    _index = value;
                  });
                  return _index;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                        _index == 0
                            ? widget.horoscopeModel.yesterdayDes
                            : _index == 1
                                ? widget.horoscopeModel.todayDes
                                : widget.horoscopeModel.tomorrowDes,
                        // softWrap: true,
                        // overflow: TextOverflow.ellipsis,
                        // maxLines: 11,
                        style: AppStyles.styleRegular20(context).copyWith(
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
        ));
  }

  Padding getDesktopHoroscopeDetailsCard(BuildContext context, double width) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              SizedBox(
                  width: width / 8,
                  height: width / 8,
                  child: Image.asset(
                    widget.horoscopeModel.image,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomTHoroscopeToggleButton(
                index: _index,
                callBack: (value) {
                  setState(() {
                    _index = value;
                  });
                  return _index;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                        _index == 0
                            ? widget.horoscopeModel.yesterdayDes
                            : _index == 1
                                ? widget.horoscopeModel.todayDes
                                : widget.horoscopeModel.tomorrowDes,
                        // softWrap: true,
                        // overflow: TextOverflow.ellipsis,
                        // maxLines: 11,
                        style: AppStyles.styleRegular20(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 34),
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

typedef int IntCallBack(int value);

class CustomTHoroscopeToggleButton extends StatefulWidget {
  CustomTHoroscopeToggleButton(
      {super.key, required this.index, required this.callBack});
  int index;
  final IntCallBack callBack;

  @override
  State<CustomTHoroscopeToggleButton> createState() =>
      _CustomTHoroscopeToggleButtonState();
}

class _CustomTHoroscopeToggleButtonState
    extends State<CustomTHoroscopeToggleButton> {
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: AppColors.white,

        color: Colors.black.withOpacity(0.7),
        //fillColor: AppColors.black,
        renderBorder: true,
        borderRadius: BorderRadius.circular(16),
        borderWidth: 3,
        //splashColor: AppColors.lightPurple2,

        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 40, vertical: width / 80),
            child: Text(
              'Yesterday',
              style: isSelected[0]
                  ? TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 20 : 32))
                  : TextStyle(
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 20 : 32)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 40, vertical: width / 80),
            child: Text(
              'Today',
              style: isSelected[1]
                  ? TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 20 : 32))
                  : TextStyle(
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 20 : 32)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 40, vertical: width / 80),
            child: Text(
              'Tomorrow',
              style: isSelected[2]
                  ? TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 20 : 32))
                  : TextStyle(
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 20 : 32)),
            ),
          ),
        ],
        onPressed: (newIndex) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              if (i == newIndex) {
                isSelected[i] = true;
                widget.index = i;
              } else {
                isSelected[i] = false;
              }
              // if (widget.index == newIndex) {
              //   isSelected[widget.index] = true;
              // } else {
              //   isSelected[widget.index] = false;
              // }

              widget.callBack(widget.index);
              CustomHoroscopeDetailsCard.of(context)!.index = widget.index;
            }
          });
        },
      ),
    );
  }
}
