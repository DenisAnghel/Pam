// PRESENTATION/widgets/doctor_list.dart
import 'package:flutter/material.dart';
import '../../DOMAIN/models/doctor.dart';

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors;

  DoctorList({required this.doctors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return ListTile(
          title: Text(doctor.name),
          subtitle: Text('${doctor.specialty} - ${doctor.location}'),
        );
      },
    );
  }
}
