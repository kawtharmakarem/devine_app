import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/widgets/face_reading_widgets/scan_face_widget.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';


class FaceReadingView extends StatefulWidget {
  const FaceReadingView({super.key});

  @override
  State<FaceReadingView> createState() => _FaceReadingViewState();
}

class _FaceReadingViewState extends State<FaceReadingView> {
// 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: 'Face Reading', leading: true),
      body:const Column(children: [
        Expanded(child: ScanFaceWidget())
      ],),
    );
  }
}