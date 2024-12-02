// PRESENTATION/widgets/carousel_with_dots.dart
import 'package:flutter/material.dart';
import '../../DOMAIN/models/banner_data.dart';

class CarouselWithDots extends StatelessWidget {
  final List<BannerData> banners;

  CarouselWithDots({required this.banners});

  @override
  Widget build(BuildContext context) {
    return banners.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Container(
      height: 150,
      child: PageView(
        children: banners.map((banner) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(banner.imageUrl, fit: BoxFit.cover),
          );
        }).toList(),
      ),
    );
  }
}
