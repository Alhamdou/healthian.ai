import 'package:flutter/material.dart';

class Hospital {
  final String name;
  final String country;
  final String location;
  final String note;
  final double ratings;
  final String imagePath;

  Hospital({
    required this.name,
    required this.country,
    required this.location,
    required this.note,
    required this.ratings,
    required this.imagePath,
  });
}

class Hospitals extends StatefulWidget {
  const Hospitals({Key? key}) : super(key: key);

  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  final List<Hospital> hospitals = [
    Hospital(
      name: "Hospital A",
      country: "Country A",
      location: "Location A",
      note: "Note A",
      ratings: 4.5,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital B",
      country: "Country B",
      location: "Location B",
      note: "Note B",
      ratings: 4.2,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital C",
      country: "Country C",
      location: "Location C",
      note: "Note C",
      ratings: 4.8,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital C",
      country: "Country C",
      location: "Location C",
      note: "Note C",
      ratings: 4.8,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital C",
      country: "Country C",
      location: "Location C",
      note: "Note C",
      ratings: 4.8,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital C",
      country: "Country C",
      location: "Location C",
      note: "Note C",
      ratings: 4.8,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital C",
      country: "Country C",
      location: "Location C",
      note: "Note C",
      ratings: 4.8,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital C",
      country: "Country C",
      location: "Location C",
      note: "Note C",
      ratings: 4.8,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital C",
      country: "Country C",
      location: "Location C",
      note: "Note C",
      ratings: 4.8,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital C",
      country: "Country C",
      location: "Location C",
      note: "Note C",
      ratings: 4.8,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital C",
      country: "Country C",
      location: "Location C",
      note: "Note C",
      ratings: 4.8,
      imagePath: "assets/icons/fever.png",
    ),
    Hospital(
      name: "Hospital C",
      country: "Country C",
      location: "Location C",
      note: "Note C",
      ratings: 4.8,
      imagePath: "assets/icons/fever.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hospital List'),
        ),
        body: ListView.builder(
          itemCount: hospitals.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle tap event for the hospital
                _navigateToHospitalDetails(hospitals[index]);
              },
              child: HospitalCard(hospital: hospitals[index]),
            );
          },
        ),
      ),
    );
  }

  void _navigateToHospitalDetails(Hospital hospital) {
    // Implement navigation to the hospital details screen
    // You can use Navigator.push or any other navigation approach here
    print('Navigating to ${hospital.name} details...');
  }
}

class HospitalCard extends StatelessWidget {
  final Hospital hospital;

  const HospitalCard({Key? key, required this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          hospital.imagePath,
          fit: BoxFit.cover,
          width: 100,
          height: double.infinity,
        ),
        title: Text(hospital.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Country: ${hospital.country}'),
            Text('Location: ${hospital.location}'),
            Text('Note: ${hospital.note}'),
            Row(
              children: [
                _buildRatingStars(hospital.ratings),
                const SizedBox(width: 4),
                Text(hospital.ratings.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      Icon starIcon = i < rating
          ? const Icon(Icons.star, color: Colors.amber)
          : const Icon(Icons.star_border, color: Colors.amber);
      stars.add(starIcon);
    }
    return Row(children: stars);
  }
}

void main() {
  runApp(const Hospitals());
}
