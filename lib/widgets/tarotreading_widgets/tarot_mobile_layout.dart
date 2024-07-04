import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tarot_read_body.dart';

class TarotMobileLayout extends StatelessWidget {
  const TarotMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // String quest=ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
      appBar: CustomAppBar(title: "What's Your Question?",actions: Icons.close,actionesFn: (){
        Get.back();
      }, leading: false,),
      body:const Column(
        children: [Expanded(child: TarotReadViewBody())],
      ),
    );
  }
}

