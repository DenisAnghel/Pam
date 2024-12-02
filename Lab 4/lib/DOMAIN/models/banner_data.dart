//DOMAIN/models/banner_data.dart
class BannerData {
  final String title;
  final String imageUrl;

  BannerData({
    required this.title,
    required this.imageUrl,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) {
    return BannerData(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
    );
  }
}