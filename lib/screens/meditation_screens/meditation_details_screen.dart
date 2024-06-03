import 'package:divinecontrol/models/meditation_models/meditation_models.dart';
import 'package:divinecontrol/widgets/meditation_widgets/meditation_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class MeditationDetailsScreen extends StatefulWidget {
  const MeditationDetailsScreen({super.key, required this.meditationModel});
final MeditationModel meditationModel;

  @override
  State<MeditationDetailsScreen> createState() => _MeditationDetailsScreenState();
}

class _MeditationDetailsScreenState extends State<MeditationDetailsScreen> {
  final _controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.meditationModel.title,
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.leftArrow),
          
        ),
        actions: [Image.asset(widget.meditationModel.image)],
      ),
      body:width<AppConstants.maxMobileWidth? getMobileMedia():width<AppConstants.maxTabletWidth? getTabletMedia() :getDesktopMedia());
    
  }

  Column getMobileMedia() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _controller,
            itemCount: widget.meditationModel.videos?.length,
            itemBuilder: (context,index){
              return MeditationMediaCard(videoId: widget.meditationModel.videos?[index] ?? "", title: widget.meditationModel.videoTitles?[index] ?? "No videos to Display");
            }),
        ),
        const SizedBox(height: 5,),
      ],
    );
  }

  Column getTabletMedia() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount:widget.meditationModel.videos?.length,
              itemBuilder: (context, index) {
              return MeditationMediaCard(videoId: widget.meditationModel.videos?[index] ?? "", title: widget.meditationModel.videoTitles?[index] ?? "No videos to Display");
              }),
        ),
      ],
    );
  }

Column getDesktopMedia() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount:widget.meditationModel.videos?.length,
              itemBuilder: (context, index) {
              return MeditationMediaCard(videoId: widget.meditationModel.videos?[index] ?? "", title: widget.meditationModel.videoTitles?[index] ?? "No videos to Display");
              }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}




