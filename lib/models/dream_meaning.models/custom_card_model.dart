
class CustomCardModel{
  final String title;
  final String image;
    final void Function() onTap;


  CustomCardModel(this.onTap,{required this.title, required this.image});
  
}