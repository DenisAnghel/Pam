// DATA/repositories/doctor_repository.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../DOMAIN/models/doctor.dart';
import '../../DOMAIN/models/category.dart';
import '../../DOMAIN/models/banner_data.dart';

class BannerRepository {
  Future<Map<String, dynamic>> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/doctors.json');
    return json.decode(response);
  }



  Future<List<BannerData>> getBanners() async {
    final data = await loadJsonData();
    return (data['banners'] as List)
        .map((banner) => BannerData(
      title: banner['title'],
      imageUrl: banner['image'],
    ))
        .toList();
  }
}
