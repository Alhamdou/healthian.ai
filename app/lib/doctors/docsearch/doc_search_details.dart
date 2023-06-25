// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String profession;
  final String country;
  final String hospital;
  final String image;
  final double rating;

  Doctor({
    required this.name,
    required this.profession,
    required this.country,
    required this.hospital,
    required this.image,
    required this.rating,
  });
}

final List<Doctor> doctors = [
  Doctor(
    name: "Dr. Jane Doe",
    profession: "Cardiologist",
    country: "USA",
    hospital: "St. Joseph Hospital",
    image: "assets/images/dr-ismaila.jpg",
    rating: 4.5,
  ),
  Doctor(
    name: "Dr. John Smith",
    profession: "Pediatrician",
    country: "Canada",
    hospital: "Sunnybrook Hospital",
    image: "assets/images/dr-ismaila.jpg",
    rating: 4.2,
  ),
  Doctor(
    name: "Dr. Sarah Johnson",
    profession: "Neurologist",
    country: "USA",
    hospital: "Mayo Clinic",
    image: "assets/images/dr-ismaila.jpg",
    rating: 4.8,
  ),
  Doctor(
    name: "Dr. Alex Lee",
    profession: "Oncologist",
    country: "Australia",
    hospital: "Peter MacCallum Cancer Centre",
    image: "assets/images/dr-ismaila.jpg",
    rating: 4.1,
  ),
  Doctor(
    name: "Dr. Emily Wang",
    profession: "Dermatologist",
    country: "China",
    hospital: "Beijing United Family Hospital",
    image: "assets/images/dr-ismaila.jpg",
    rating: 4.6,
  ),
  Doctor(
    name: "Dr. Hassan Ali",
    profession: "Psychiatrist",
    country: "Pakistan",
    hospital: "Aga Khan University Hospital",
    image: "assets/images/dr-ismaila.jpg",
    rating: 4.3,
  ),
  Doctor(
    name: "Dr. Maria Rodriguez",
    profession: "Obstetrician",
    country: "Spain",
    hospital: "Hospital La Paz",
    image: "assets/images/dr-ismaila.jpg",
    rating: 4.7,
  ),
  Doctor(
    name: "Dr. Ahmed Khalil",
    profession: "Orthopedist",
    country: "Egypt",
    hospital: "El-Salam International Hospital",
    image: "assets/images/dr-ismaila.jpg",
    rating: 4.4,
  ),
  Doctor(
    name: "Dr. Kim Yoo-jin",
    profession: "Gynecologist",
    country: "South Korea",
    hospital: "Seoul National University Hospital",
    image: "assets/images/dr-ismaila.jpg",
    rating: 4.9,
  ),
  Doctor(
    name: "Dr. Muhammad Khan",
    profession: "Endocrinologist",
    country: "Pakistan",
    hospital: "Shaukat Khanum Memorial Cancer Hospital and Research Centre",
    image: "assets/images/dr-ismaila.jpg",
    rating: 4.0,
  ),
];

@override
Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: doctors.length,
    itemBuilder: (BuildContext context, int index) {
      return DoctorCard(
        doctor: doctors[index],
      );
    },
  );
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          // backgroundImage: NetworkImage(doctor.avatar),
          radius: 30,
        ),
        title: Text(doctor.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doctor.profession),
            Text(doctor.country),
            Text(doctor.hospital),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.amber),
            Text(doctor.rating.toString()),
          ],
        ),
      ),
    );
  }
}
