import 'package:flutter/material.dart';
import '../../DATA/repositories/doctor_repository.dart';
import '../widgets/carousel_with_dots.dart';
import '../widgets/doctor_list.dart';
import '../widgets/category_grid.dart';
import '../../DOMAIN/models/doctor.dart';
import '../../DOMAIN/models/category.dart';
import '../../DOMAIN/models/banner_data.dart';

class DoctorSearchPage extends StatefulWidget {
  final DoctorRepository doctorRepository;

  DoctorSearchPage({required this.doctorRepository});

  @override
  _DoctorSearchPageState createState() => _DoctorSearchPageState();
}

class _DoctorSearchPageState extends State<DoctorSearchPage> {
  List<Doctor> doctors = [];
  List<Category> categories = [];
  List<BannerData> banners = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final loadedDoctors = await widget.doctorRepository.getDoctors();

      // Testare debug
      print('Loaded doctors: $loadedDoctors');

      // Date mock pentru categorii și bannere (dacă nu există în JSON)
      final mockCategories = [
        Category(title: "Cardiology", iconUrl: "assets/icons/cardiology.png"),
        Category(title: "Dentistry", iconUrl: "assets/icons/dermatology.png"),
        Category(title: "Orthopedics", iconUrl: "assets/icons/dermatology.png"),
        Category(title: "Dermatology", iconUrl: "assets/icons/dermatology.png"),
        Category(title: "Pediatrics", iconUrl: "assets/icons/dermatology.png"),
        Category(title: "Ophthalmology", iconUrl: "assets/icons/dermatology.png"),
      ];

      final mockBanners = [
        BannerData(title: "Cardiology", imageUrl: "assets/banners/health1.png"),
        BannerData(title: "Dentistry", imageUrl: "assets/banners/discount1.png"),
        BannerData(title: "Orthopedics", imageUrl: "assets/banners/health1.png"),
        BannerData(title: "Dermatology", imageUrl: "assets/banners/discount1.png"),
        BannerData(title: "Pediatrics", imageUrl: "assets/banners/health1.png"),
        BannerData(title: "Ophthalmology", imageUrl: "assets/banners/discount1.png"),
      ];

      setState(() {
        doctors = loadedDoctors;
        categories = mockCategories;
        banners = mockBanners;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Search'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search doctors...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              banners.isNotEmpty
                  ? CarouselWithDots(banners: banners)
                  : Text('No banners available'),
              SizedBox(height: 16),
              categories.isNotEmpty
                  ? CategoryGrid(categories: categories)
                  : Text('No categories available'),
              SizedBox(height: 16),
              Text('Doctors', style: TextStyle(fontWeight: FontWeight.bold)),
              doctors.isNotEmpty
                  ? DoctorList(doctors: doctors)
                  : Text('No doctors available'),
            ],
          ),
        ),
      ),
    );
  }
}
