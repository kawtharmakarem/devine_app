import 'package:divinecontrol/models/tarotreading_models/tarot_result_card_model.dart';

class GridViewItemModel {
  final String imageBg;
  final String image;
  final String title;
  final String subTitle;
  final String description;
  final List<TarotResultCardModel> results;
  // final double likesNumber;
  // final double seeNumber;

  // final String cardTitle;
  // final String detailsTitle;
  // final String details;

  GridViewItemModel(
      {required this.image,
      required this.imageBg,
      required this.title,
      required this.description,
      required this.subTitle,
      required this.results,
      // required this.likesNumber,
      // required this.seeNumber,
  //     required this.cardTitle, 
  // required  this.details,
  //    required this.detailsTitle
     });
}
