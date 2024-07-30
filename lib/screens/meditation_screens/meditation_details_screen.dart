import 'package:divinecontrol/models/meditation_models/meditation_models.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/meditation_widgets/meditation_details_card.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

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
      appBar: CustomAppBar(title: widget.meditationModel.title, leading: true,
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




