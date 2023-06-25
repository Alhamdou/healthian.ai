// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyDoctors extends StatefulWidget {
  const MyDoctors({Key? key, required String urlImage, required String name})
      : super(key: key);

  @override
  State<MyDoctors> createState() => _MyDoctorsState();
}

class _MyDoctorsState extends State<MyDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Doctors"),
      ),
      body: Center(child: Text("You don't have any doctors yet")),
    );
  }
}
