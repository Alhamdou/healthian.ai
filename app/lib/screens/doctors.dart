// ignore_for_file: unused_field, non_constant_identifier_names, unused_element, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, prefer_final_fields, camel_case_types

import 'package:app/screens/homePage.dart';
import 'package:app/utls/colors.dart';
import "package:flutter/material.dart";

import '../doctors/docsearch/doc_search_details.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List<Doctor> _doctors = [
    Doctor(
      name: 'Dr. Ismaila Badjie',
      profession: 'General Practitioner',
      rating: 4.5,
      country: 'USA',
      hospital: 'Innovax global health',
      image: ('assets/images/dr-ismaila.jpg'),
    ),
    Doctor(
      name: 'Dr. John Doe',
      profession: 'Dentist',
      rating: 4.2,
      country: 'Canada',
      hospital: 'Dental Health Services',
      image: ('assets/images/dr-ismaila.jpg'),
    ),
    Doctor(
      name: 'Dr. Maria Garcia',
      profession: 'Pediatrician',
      rating: 4.8,
      country: 'Spain',
      hospital: 'Madrid Children Hospital',
      image: ('assets/images/dr-ismaila.jpg'),
    ),
  ];
  List<Doctor> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchResults = _doctors;
  }

  void _filterDoctors(String query) {
    setState(() {
      _searchResults = _doctors
          .where((doctor) =>
              doctor.name.toLowerCase().contains(query.toLowerCase()) ||
              doctor.profession.toLowerCase().contains(query.toLowerCase()) ||
              doctor.country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _buildSearchBox(BuildContext context) {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search for a doctor...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white70),
      ),
      style: TextStyle(color: Colors.white),
      onChanged: (value) {
        _filterDoctors(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mButtonColor,
        elevation: 0,
        title: Text("Healthian.ai"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: _searchDelegate(doctors: _doctors),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        // backgroundImage: "",
                        radius: 40.0,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Ismaila Badjie',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'General Practicioner',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star_half, color: Colors.amber),
                                Icon(Icons.star_border, color: Colors.amber),
                                SizedBox(width: 8.0),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 9, 9),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Country: USA',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Hospital: Innovax global health',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Second Card

              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/dr-ismaila.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Ismaila Badjie',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'General Practicioner',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star_half, color: Colors.amber),
                                Icon(Icons.star_border, color: Colors.amber),
                                SizedBox(width: 8.0),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 9, 9),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Country: USA',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Hospital: Innovax global health',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/dr-ismaila.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Ismaila Badjie',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'General Practicioner',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star_half, color: Colors.amber),
                                Icon(Icons.star_border, color: Colors.amber),
                                SizedBox(width: 8.0),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 9, 9),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Country: USA',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Hospital: Innovax global health',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/dr-ismaila.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Ismaila Badjie',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'General Practicioner',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star_half, color: Colors.amber),
                                Icon(Icons.star_border, color: Colors.amber),
                                SizedBox(width: 8.0),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 9, 9),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Country: USA',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Hospital: Innovax global health',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/dr-ismaila.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Ismaila Badjie',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'General Practicioner',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star_half, color: Colors.amber),
                                Icon(Icons.star_border, color: Colors.amber),
                                SizedBox(width: 8.0),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 9, 9),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Country: USA',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Hospital: Innovax global health',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/dr-ismaila.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Ismaila Badjie',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'General Practicioner',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star_half, color: Colors.amber),
                                Icon(Icons.star_border, color: Colors.amber),
                                SizedBox(width: 8.0),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 9, 9),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Country: USA',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Hospital: Innovax global health',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/dr-ismaila.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Ismaila Badjie',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'General Practicioner',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star_half, color: Colors.amber),
                                Icon(Icons.star_border, color: Colors.amber),
                                SizedBox(width: 8.0),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 9, 9),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Country: USA',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Hospital: Innovax global health',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _searchDelegate {

// }

class _searchDelegate extends SearchDelegate<dynamic> {
  final List<Doctor> doctors;

  _searchDelegate({required this.doctors});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results page here.
    // You can use the query parameter to filter the doctors list.
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? doctors
        : doctors
            .where((doctor) =>
                doctor.name.toLowerCase().contains(query.toLowerCase()) ||
                doctor.profession.toLowerCase().contains(query.toLowerCase()) ||
                doctor.country.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion.name),
          subtitle: Text(suggestion.profession),
          onTap: () {
            close(context, suggestion);
          },
        );
      },
    );
  }
}
