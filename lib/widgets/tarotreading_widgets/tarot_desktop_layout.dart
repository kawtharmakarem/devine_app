
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homepage_widgets/custom_appbar.dart';
import 'tarot_read_body.dart';

class TarotDesktopLayout extends StatelessWidget {
  const TarotDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: "What's Your Question?",actions: Icons.close,actionesFn: (){
        Get.back();
      }, leading: false,),
      body:const Column(
        children: [Expanded(child: TarotReadViewBody())],
      ),
    );
  }
}
