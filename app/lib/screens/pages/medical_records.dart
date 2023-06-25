// ignore_for_file: prefer_final_fields, unused_field, use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MedicalReports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Record',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MedicalRecordScreen(),
    );
  }
}

class MedicalRecordScreen extends StatefulWidget {
  @override
  _MedicalRecordScreenState createState() => _MedicalRecordScreenState();
}

class _MedicalRecordScreenState extends State<MedicalRecordScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _medicalRecordsRef =
      FirebaseFirestore.instance.collection('medical_records');

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _diagnosisController = TextEditingController();
  TextEditingController _allergiesController = TextEditingController();
  TextEditingController _medicationsController = TextEditingController();

  Future<void> addMedicalRecord() async {
    try {
      await _medicalRecordsRef.add({
        'name': _nameController.text,
        'age': _ageController.text,
        'gender': _genderController.text,
        'diagnosis': _diagnosisController.text,
        'allergies': _allergiesController.text,
        'medications': _medicationsController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Medical record added successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add medical record')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _diagnosisController.dispose();
    _allergiesController.dispose();
    _medicationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Record'),
      ),
      body: SingleChildScrollView(  // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextField(
                controller: _diagnosisController,
                decoration: InputDecoration(labelText: 'Diagnosis'),
              ),
              TextField(
                controller: _allergiesController,
                decoration: InputDecoration(labelText: 'Allergies'),
              ),
              TextField(
                controller: _medicationsController,
                decoration: InputDecoration(labelText: 'Medications'),
              ),
              SizedBox(height: 16),
              RaisedButton(
                onPressed: addMedicalRecord,
                child: Text('Add Medical Record'),
              ),
              SizedBox(height: 16),
              Text(
                'Medical Records',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _medicalRecordsRef.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Failed to load records');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  final records = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,  // Add shrinkWrap to ListView.builder
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      final record = records[index].data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text('Name: ${record['name']}'),
                        subtitle: Text('Diagnosis: ${record['diagnosis']}'),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MedicalReports());
}
