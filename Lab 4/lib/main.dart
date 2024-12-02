import 'package:lab44/DATA/repositories/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'DOMAIN/models/json_data_source.dart';
import 'PRESENTATION/pages/doctor_search_page.dart';

void main() {
  // Initialize data sources
  final jsonDataSource = JsonDataSource();

  // Initialize repositories with the data source
  final doctorRepository = DoctorRepository(jsonDataSource);  // Correctly passing the instance

  runApp(MyApp(
    doctorRepository: doctorRepository,
  ));
}

class MyApp extends StatelessWidget {
  final DoctorRepository doctorRepository;

  MyApp({
    required this.doctorRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorSearchPage(
        doctorRepository: doctorRepository,  // Pass repository to the page
      ),
    );
  }
}
