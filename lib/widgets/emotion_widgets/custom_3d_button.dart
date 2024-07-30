import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class Custom3DButton extends StatelessWidget {
  const Custom3DButton({
    super.key,
     required this.onTap, required this.title, required this.image,
  });

   final   void Function() onTap;
   final String title;
   final String image;


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      
      decoration: BoxDecoration(color: Colors.grey[300],
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(colors: [Color.lerp(Colors.grey[400],Colors.white, 0.1) as Color,
      Color.lerp(Colors.white, Colors.grey[100], 0.2) as Color]),
      boxShadow: [
        BoxShadow(color: Colors.grey,offset: Offset(5, 5),blurRadius: 3,spreadRadius: 1.7),
        BoxShadow(color: Colors.white,offset: Offset(-3 ,-3),blurRadius: 3,spreadRadius: 1)
      ],
      border: Border.all(width: 0.5,color: Colors.white)),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
           
            SizedBox(
              
                width: width < AppConstants.maxMobileWidth
                    ? width / 4
                    : width < AppConstants.maxTabletWidth
                        ? width / 5
                        : width / 8,
                height: width < AppConstants.maxMobileWidth
                    ? width / 6
                    : width < AppConstants.maxTabletWidth
                        ? width / 8
                        : width / 12,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                )),
            Text(
              title,textAlign: TextAlign.center,
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 18))
                  : width < AppConstants.maxTabletWidth
                      ? AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 22))
                      : AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 32)),
            ),
                       
      
          ],
        ),
      ),
    );
  }
}


// class Custom3DButton1 extends StatelessWidget {
//   const Custom3DButton1({
//     super.key,
//      required this.onTap, required this.title, required this.image,
//   });

//    final   void Function() onTap;
//    final String title;
//    final String image;


//   @override
//   Widget build(BuildContext context) {
//     double width=MediaQuery.sizeOf(context).width;
//     return Container(
      
//       decoration: BoxDecoration(
//       // gradient: LinearGradient(colors: [Color.lerp(Colors.grey[400],Colors.white, 0.1) as Color,
//       // Color.lerp(Colors.white, Colors.grey[100], 0.2) as Color]),
//       boxShadow: [
//         BoxShadow(color: Colors.grey,offset: Offset(5, 5),blurRadius: 3,spreadRadius: 1.7),
//         BoxShadow(color: Colors.white,offset: Offset(-3 ,-3),blurRadius: 3,spreadRadius: 1)
//       ],
//       border: Border.all(width: 0.5,color: Colors.white)),
//       child: 
//       GestureDetector(
//         onTap: onTap,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
          
//           children: [
           
//             SizedBox(
              
//                 width: width < AppConstants.maxMobileWidth
//                     ? width / 4
//                     : width < AppConstants.maxTabletWidth
//                         ? width / 5
//                         : width / 8,
//                 height: width < AppConstants.maxMobileWidth
//                     ? width / 6
//                     : width < AppConstants.maxTabletWidth
//                         ? width / 8
//                         : width / 12,
//                 child: Image.asset(
//                   image,
//                   fit: BoxFit.fill,
//                 )),
//             Text(
//               title,textAlign: TextAlign.center,
//               style: width < AppConstants.maxMobileWidth
//                   ? AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 18))
//                   : width < AppConstants.maxTabletWidth
//                       ? AppStyles.styleBold24(context).copyWith(
//                           fontSize:
//                               getResponsiveFontSizeText(context, fontSize: 22))
//                       : AppStyles.styleBold24(context).copyWith(
//                           fontSize:
//                               getResponsiveFontSizeText(context, fontSize: 32)),
//             ),
                       
      
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Custom3DButton2 extends StatelessWidget {
//   const Custom3DButton2({
//     super.key,
//      required this.onTap, required this.title, required this.image,
//   });

//    final   void Function() onTap;
//    final String title;
//    final String image;


//   @override
//   Widget build(BuildContext context) {
//     double width=MediaQuery.sizeOf(context).width;
//     return Container(
      
//       decoration: BoxDecoration(
//       // gradient: LinearGradient(colors: [Color.lerp(Colors.grey[400],Colors.white, 0.1) as Color,
//       // Color.lerp(Colors.white, Colors.grey[100], 0.2) as Color]),
//       boxShadow: [
//         BoxShadow(color:AppColors.white,offset: Offset(5, 5),blurRadius: 3,spreadRadius: 1.7),
//         BoxShadow(color: AppColors.primary,offset: Offset(-3 ,-3),blurRadius: 3,spreadRadius: 1)
//       ],
//       border: Border.all(width: 0.5,color: Colors.white)
//       ),
//       child: 
//       GestureDetector(
//         onTap: onTap,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
          
//           children: [
           
//             SizedBox(
              
//                 width: width < AppConstants.maxMobileWidth
//                     ? width / 4
//                     : width < AppConstants.maxTabletWidth
//                         ? width / 5
//                         : width / 8,
//                 height: width < AppConstants.maxMobileWidth
//                     ? width / 6
//                     : width < AppConstants.maxTabletWidth
//                         ? width / 8
//                         : width / 12,
//                 child: Image.asset(
//                   image,
//                   fit: BoxFit.fill,
//                 )),
//             Text(
//               title,textAlign: TextAlign.center,
//               style: width < AppConstants.maxMobileWidth
//                   ? AppStyles.styleBold24(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize: 18))
//                   : width < AppConstants.maxTabletWidth
//                       ? AppStyles.styleBold24(context).copyWith(
//                           fontSize:
//                               getResponsiveFontSizeText(context, fontSize: 22))
//                       : AppStyles.styleBold24(context).copyWith(
//                           fontSize:
//                               getResponsiveFontSizeText(context, fontSize: 32)),
//             ),
                       
      
//           ],
//         ),
//       ),
//     );
//   }
// }