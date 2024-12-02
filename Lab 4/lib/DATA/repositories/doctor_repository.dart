import '../../DOMAIN/models/json_data_source.dart';
import '../../DOMAIN/models/doctor.dart';

class DoctorRepository {
  final JsonDataSource jsonDataSource;

  DoctorRepository(this.jsonDataSource);

  Future<List<Doctor>> getDoctors() async {
    final data = await jsonDataSource.loadJsonData();
    return (data['doctors'] as List)
        .map((doctor) => Doctor(
      name: doctor['full_name'],
      specialty: doctor['type_of_doctor'],
      location: doctor['location_of_center'],
      rating: doctor['review_rate'],
      reviews: doctor['reviews_count'],
      imageUrl: doctor['image'],
    ))
        .toList();
  }
}
