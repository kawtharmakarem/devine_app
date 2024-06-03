class MeditationModel{
  final String image;
  final String title;
  final List<String>? videos;
  final List<String>? videoTitles;

  MeditationModel({required this.image, required this.title, this.videos, this.videoTitles});
}