import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find a Doctor"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Looking for Specialist Doctors?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Categories Section
              const CategorySection(),
              const SizedBox(height: 20),

              // Carousel Slider for Nearby Medical Centers
              const Text(
                "Nearby Medical Centers",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              MedicalCentersCarousel(),
              const SizedBox(height: 20),

              // Doctors Section
              const Text(
                "Doctors",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DoctorCard(
                doctorName: "Dr. David Patel",
                specialty: "Cardiologist",
              ),
              DoctorCard(
                doctorName: "Dr. Jessica Turner",
                specialty: "Gynecologist",
              ),
              DoctorCard(
                doctorName: "Dr. Michael Johnson",
                specialty: "Orthopedic Surgeon",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Categories Section
class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.favorite, 'label': 'Cardiology'},
      {'icon': Icons.local_hospital, 'label': 'Orthopedics'},
      {'icon': Icons.healing, 'label': 'Dermatology'},
      {'icon': Icons.child_care, 'label': 'Pediatrics'},
      {'icon': Icons.visibility, 'label': 'Ophthalmology'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue[100],
                  child: Icon(category['icon'] as IconData, color: Colors.blue),
                ),
                const SizedBox(height: 5),
                Text(
                  category['label'] as String,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Carousel Slider for Nearby Medical Centers
class MedicalCentersCarousel extends StatelessWidget {
  MedicalCentersCarousel({Key? key}) : super(key: key);

  final List<Map<String, String>> centers = [
    {
      'name': 'Santos Health Clinic',
      'location': '2.5 miles away',
      'image': 'https://via.placeholder.com/400'
    },
    {
      'name': 'Golden Care Hospital',
      'location': '3.1 miles away',
      'image': 'https://via.placeholder.com/400'
    },
    {
      'name': 'Sunrise Medical Center',
      'location': '4.8 miles away',
      'image': 'https://via.placeholder.com/400'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: centers.map((center) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      center['image']!,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          center['name']!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          center['location']!,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

// Doctor Card Widget
class DoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialty;

  const DoctorCard({
    Key? key,
    required this.doctorName,
    required this.specialty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.person, color: Colors.blue[700]),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                specialty,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
