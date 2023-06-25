// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:app/utls/math_utils.dart';
import 'package:flutter/material.dart';

import '../../machine learning/ml_model.dart';

class DocHomePage extends StatefulWidget {
  const DocHomePage({Key? key}) : super(key: key);

  @override
  State<DocHomePage> createState() => _DocHomePageState();
}

class _DocHomePageState extends State<DocHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors HomePage"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 50),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text("Hi doc welcome on board"),
              )),
            ),
            RaisedButton(
                child: Text(
                  "Pneumonia Disease Prediction!",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyModel(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
