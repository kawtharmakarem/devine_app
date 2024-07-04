// import 'package:flutter/material.dart';

// import 'tarot_read_body.dart';

// class TarotTabletLayout extends StatelessWidget {
//   const TarotTabletLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         // CustomDrawer(),
//         Expanded(child: TarotReadViewBody())
//       ],
//     );
//   }
// }

import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tarot_read_body.dart';

class TarotTabletLayout extends StatelessWidget {
  const TarotTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:CustomAppBar(title: "What's Your Question?",actions: Icons.close,actionesFn: (){
        Get.back();
      }, leading: false,),
      body:const Column(
        children: [Expanded(child: TarotReadViewBody())],
      ),
    );
  }
}
