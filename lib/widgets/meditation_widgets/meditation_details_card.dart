//   final videoUrl="https://www.youtube.com/watch?v=3zmMWUUijMo";

import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MeditationMediaCard extends StatefulWidget {
  const MeditationMediaCard({super.key, required this.videoId, required this.title});
  final String videoId;
  final String title;
  @override
  State<MeditationMediaCard> createState() => _MeditationMediaCardState();
}

class _MeditationMediaCardState extends State<MeditationMediaCard> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.hardEdge,
        child:width<AppConstants.maxMobileWidth? getMobileMeditationMediaCardCard(width, context):width<AppConstants.maxTabletWidth?  getTabletMeditationMediaCardCard(width, context):getDesktopMeditationMediaCardCard(width, context),
      ),
    );
  }

  Column getMobileMeditationMediaCardCard(double width, BuildContext context) {
    return Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style:  AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 20)),
                    
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )),
          Container(
            height: width * 0.4,
            width: width,
            child: YoutubePlayer(controller: _controller),
          ),
          
        ],
      );
  }


Column getTabletMeditationMediaCardCard(double width, BuildContext context) {
    return Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              padding:const EdgeInsets.symmetric(horizontal: 50),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Text(
                widget.title,textAlign: TextAlign.center,
                style: AppStyles.styleBold24(context)
                        .copyWith(color: AppColors.black),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
          Container(
            height: width * 0.3,
            width: width,
            child: YoutubePlayer(controller: _controller),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      );
  }

   Column getDesktopMeditationMediaCardCard(double width, BuildContext context) {
    return Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              padding:const EdgeInsets.symmetric(horizontal: 50),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Text(
                widget.title,textAlign: TextAlign.center,
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleBold24(context)
                    : AppStyles.styleBold32(context)
                        .copyWith(color: AppColors.black),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
          Container(
            height: width * 0.2,
            width: width,
            child: YoutubePlayer(controller: _controller),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      );
  }
}
