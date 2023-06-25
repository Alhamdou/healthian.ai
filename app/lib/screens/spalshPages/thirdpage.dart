// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:your_app_name/splash_screen.dart';


import '../splash_screen.dart';



class FirstScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image.asset(
            //   'assets/images/nutritionist-1.jpg',
            //   width: 200,
            //   height: 200,
            // ),
            SvgPicture.asset("assets/images/onbaord_4.svg", fit: BoxFit.contain,
                height: 500,
                width: 80,),
            SizedBox(height: 20),
            Text(
              'Consultations around 🗺️',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text("We are 🕰️  available for the assitance of our patience ", style: TextStyle(color: Colors.white, fontFamily: "Roboto"),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[700],
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
