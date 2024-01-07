import 'package:healtypet/models/service_model.dart';

class DoctorModel {
  String name;
  String picture;
  List<String> services;
  int distance;

  DoctorModel({
    required this.name,
    required this.distance,
    required this.picture,
    required this.services,
  });
}

var doctors = [
  DoctorModel(
      name: "Dr. Stone",
      distance: 10,
      picture: "Dr. Stone.jpg",
      services: [
        Service.veccine,
        Service.surgery,
      ])
];
