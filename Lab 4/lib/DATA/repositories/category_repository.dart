// DATA/repositories/doctor_repository.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../DOMAIN/models/doctor.dart';
import '../../DOMAIN/models/category.dart';
import '../../DOMAIN/models/banner_data.dart';

class CategoryRepository {
  Future<Map<String, dynamic>> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/doctors.json');
    return json.decode(response);
  }


  Future<List<Category>> getCategories() async {
    final data = await loadJsonData();
    return (data['categories'] as List)
        .map((category) => Category(
      title: category['title'],
      iconUrl: category['icon'],
    ))
        .toList();
  }


}
