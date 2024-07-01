class GridViewItemModel {
  final String image;
  final String title;
  final String description;
  final double likesNumber;
  final double seeNumber;
  final String cardTitle;
  final String detailsTitle;
  final String details;

  GridViewItemModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.likesNumber,
      required this.seeNumber,
      required this.cardTitle, 
  required  this.details,
     required this.detailsTitle});
}
