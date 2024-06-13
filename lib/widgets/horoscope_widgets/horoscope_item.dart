import 'package:divinecontrol/models/horoscope_models/horoscope_model.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HoroscopeItem extends StatefulWidget {
  const HoroscopeItem(
      {super.key,
      required this.index,
      required this.horoscopeModel,
      required this.onTap});
  final int index;
  final HoroscopeModel horoscopeModel;
  final void Function() onTap;

  @override
  State<HoroscopeItem> createState() => _HoroscopeItemState();
}

class _HoroscopeItemState extends State<HoroscopeItem> {
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return AnimatedContainer(
      width: width / 20,
      height: width / 15,
      // margin: EdgeInsets.only(bottom: width / 20),
      duration: Duration(milliseconds: 300 + (widget.index * 150)),
      transform: Matrix4.translationValues(startAnimation ? 0 : width, 0, 0),
      curve: Curves.decelerate,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: [
            Card(
                elevation: 2,
                shape: const CircleBorder(
                    side: BorderSide(width: 1, color: AppColors.black)),
                clipBehavior: Clip.hardEdge,
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width < AppConstants.maxMobileWidth
                            ? width / 20
                            : width / 40,
                        vertical: width < AppConstants.maxMobileWidth
                            ? width / 20
                            : width / 40),
                    child: SizedBox(
                        width: width < AppConstants.maxMobileWidth
                            ? width / 6
                            : width < AppConstants.maxTabletWidth
                                ? width / 6.5
                                : width / 10,
                        height: width < AppConstants.maxMobileWidth
                            ? width / 6
                            : width < AppConstants.maxTabletWidth
                                ? width / 6.5
                                : width / 10,
                        child: Image.asset(
                          widget.horoscopeModel.image,
                          fit: BoxFit.fill,
                        )))),
            Text(
              widget.horoscopeModel.title,
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context)
                  : width < AppConstants.maxTabletWidth
                      ? AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 28))
                      : AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 32)),
            )
          ],
        ),
      ),
    );
  }
}
