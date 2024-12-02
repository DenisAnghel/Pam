import 'dart:convert';
import 'package:lab44/DOMAIN/models/banner_data.dart';
import 'package:lab44/DOMAIN/models/category.dart';
import 'package:flutter/services.dart';

class JsonDataSource {
  Future<Map<String, dynamic>> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/doctors.json');
    return json.decode(response);
  }
}

Future<List<Category>> getCategories() async {
  final String response = await rootBundle.loadString('assets/doctors.json');
  final data = json.decode(response);

  // Ensure 'categories' exists and is a list
  if (data['categories'] is List) {
    return (data['categories'] as List)
        .map((category) => Category.fromJson(category as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Invalid JSON format for categories');
  }
}

Future<List<BannerData>> getBanners() async {
  final String response = await rootBundle.loadString('assets/doctors.json');
  final data = json.decode(response);

  // Debugging: Print the data to check the structure
  print(data);

  // Ensure 'banners' exists and is a list
  if (data['banners'] is List) {
    return (data['banners'] as List)
        .map((banner) => BannerData.fromJson(banner as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Invalid JSON format for banners');
  }
}