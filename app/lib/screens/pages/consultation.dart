// ignore_for_file: prefer_const_constructors

import 'package:app/screens/doctors.dart';
import 'package:app/utls/colors.dart';
import 'package:flutter/material.dart';

class Consultation extends StatefulWidget {
  const Consultation({Key? key}) : super(key: key);

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultation Service"),
      ),
      body: Container(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 200),
          child: Column(
            children: [
              Center(child: Text("You are yet to have a Consultaion Service")),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                  color: redColor,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Doctors()));
                  },
                  child: Text(
                    "Check Our Available Doctors",
                    style:
                        TextStyle(color: whiteColor, backgroundColor: redColor),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
