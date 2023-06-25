// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app/screens/spalshPages/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utls/colors.dart';
// import 'package:app/screens/splashPages/secondpage.dart';


class FirstScreen2 extends StatelessWidget {
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
            SvgPicture.asset("assets/images/onbaord_2.svg", fit: BoxFit.contain,
                height: 500,
                width: 80,),
            SizedBox(height: 20),
            Text(
              'Professional medics 🗺️',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),SizedBox(height:8),
      
            
            SizedBox(height: 10),
            Text(
              'The best of healthcare at your fingertips 🇬🇲',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),
            // Text(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.red[700],
        child: Icon(Icons.arrow_forward, color: whiteColor,),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FirstScreen3(),
            ),
          );
        },
      ),
    );
  }
}
