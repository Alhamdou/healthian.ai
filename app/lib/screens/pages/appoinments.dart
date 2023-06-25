// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field

import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  List<String> _services = [
    "Dentist",
    "Nutritionist",
    "Gynecologist",
    "Physiotherapist",
    "Orthopedist",
    "Surgery",
    'General check-up',
    'Dental cleaning',
    'Pediatric care',
    'Vaccinations',
    'Cardiology',
    'Neurology',
    'Dermatology',
  ];
List<String> _typeService = [
  "Video conference",
  "Home visit",
  "Clinic Visit"
];
  String? _selectedService;
  String? _selectedTypeService;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _showDatePicker() async {
    final now = DateTime.now();
    final initialDate = _selectedDate ?? now;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: now,
      lastDate: now.add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _showTimePicker() async {
    final now = TimeOfDay.now();
    final initialTime = _selectedTime ?? now;
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Widget _buildServiceDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedService,
      decoration: InputDecoration(
        labelText: 'Service',
        border: OutlineInputBorder(),
      ),
      items: _services
          .map((service) => DropdownMenuItem<String>(
                value: service,
                child: Text(service),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedService = value;
        });
      },
    );
  }
  Widget _typeServiceDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedTypeService,
      decoration: InputDecoration(
        labelText: 'Type of consultation Service',
        border: OutlineInputBorder(),
      ),
      items: _typeService
          .map((_typeService) => DropdownMenuItem<String>(
                value: _typeService,
                child: Text(_typeService),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedTypeService = value;
        });
      },
    );
  }

  Widget _buildDateButton() {
    final text = _selectedDate == null
        ? 'Select a date'
        : 'Date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
    return ElevatedButton(
      onPressed: _showDatePicker,
      child: Text(text),
    );
  }

  Widget _buildTimeButton() {
    final text = _selectedTime == null
        ? 'Select a time'
        : 'Time: ${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}';
    return ElevatedButton(
      onPressed: _showTimePicker,
      child: Text(text),
    );
  }

  // Widget _buildPriceField() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: 'Price',
  //       border: OutlineInputBorder(),
  //     ),
  //     keyboardType: TextInputType.number,
  //   );
  // }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Booking Confirmation'),
            content: Text('You will be notified on your booking soon!'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
      child: Text('Book appointment'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book an appointment'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
            _buildServiceDropdown(),
            SizedBox(height: 16.0),
            _typeServiceDropdown(),
            SizedBox(height: 16.0),
            _buildDateButton(),
            SizedBox(height: 16.0),
            _buildTimeButton(),
            SizedBox(height: 16.0),
            _buildSubmitButton(),
            SizedBox(height: 16.0),
            // _buildPriceField()
          ],
        ),
      ),
    );
  }
}
