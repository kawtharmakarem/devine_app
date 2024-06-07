import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

class HoleWidget extends StatelessWidget {
  const HoleWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: size.width < AppConstants.maxMobileWidth
            ? size.width / 2.1
            : size.width < AppConstants.maxTabletWidth
                ? size.width / 2.1
                : size.width / 2.05,
        top: size.width < AppConstants.maxMobileWidth
            ? size.height / 3
            : size.width < AppConstants.maxTabletWidth
                ? size.height / 2.5
                : size.height / 2.65,
        child: Container(
            height: 30,
            width: 30,
            decoration:
                ShapeDecoration(color: Colors.white, shape: CircleBorder())));
  }
}
