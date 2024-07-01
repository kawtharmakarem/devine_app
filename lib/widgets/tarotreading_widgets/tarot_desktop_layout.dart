// import 'package:divinecontrol/widgets/tarotreading_widgets/tarot_read_body.dart';
// import 'package:flutter/material.dart';

// class TarotDesktopLayout extends StatelessWidget {
//   const TarotDesktopLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return    const Column(
//       children: [
//         // CustomDrawer(),
//         Expanded(child: TarotReadViewBody())
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import 'tarot_read_body.dart';

// class TarotDesktopLayout extends StatelessWidget {
//   const TarotDesktopLayout({super.key});

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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'tarot_read_body.dart';

class TarotDesktopLayout extends StatelessWidget {
  const TarotDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.lightPurple2,
        title: Text(
          "Your Favourite",
          style: AppStyles.styleBold24(context)
              .copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize:40)),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon:const Icon(
                Icons.close_sharp,
                size:60,
                color: AppColors.darkPrimary,
              ))
        ],
      ),
      body:const Column(
        children: [Expanded(child: TarotReadViewBody())],
      ),
    );
  }
}
