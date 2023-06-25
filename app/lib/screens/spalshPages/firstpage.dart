// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/screens/spalshPages/secondpage.dart';
import 'package:app/utls/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FirstScreen1 extends StatelessWidget {
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
            SvgPicture.asset("assets/images/onbaord_1.svg",fit: BoxFit.contain,
                height: 500,
                width: 80,),
            SizedBox(height: 20),
            Text(
              'Welcome to Healthian.ai',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),SizedBox(height:8),
            Text(
              'Your personal health assistant under one platform',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),
            
            SizedBox(height: 10),
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
              builder: (context) => FirstScreen2(),
            ),
          );
        },
      ),
    );
  }
}
