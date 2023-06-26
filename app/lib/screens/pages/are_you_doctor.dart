// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:app/doctors/doc%20_login.dart';
import 'package:app/doctors/doctots_signu%5Bp.dart';
import 'package:app/utls/colors.dart';
import 'package:app/utls/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RealDoctors extends StatefulWidget {
  var valueFirst = false;

  RealDoctors({Key? key}) : super(key: key);

  @override
  State<RealDoctors> createState() => _RealDoctorsState();
}

class _RealDoctorsState extends State<RealDoctors> {
  bool valueFirst = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Healthian.ai")),
      body: Container(
        color: whiteColor,
        height: size.height,
        width: size.width,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 30, right: 16),
              child: Text(
                "Are You A Medical Doctor ?",
                style: TextStyle(
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                      "Millions of patients are looking for the right doctor on Healthian.ai. Start your digital journey with us",
                      style: GoogleFonts.raleway(
                          color: blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          height: 1.5)),
                ),
                SizedBox(
                  height: 20,
                ),
                // Text(
                //     "By clicking the continuing you agree to our doctors terms and condtition"),
                Checkbox(
                    value: valueFirst,
                    onChanged: (value) {
                      setState(() {
                        valueFirst = value!;
                      });
                    }),
                Text("Join Us",
                    style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.45,
                        height: 1.8)),
              ],
            ),
            // ignore: deprecated_member_use
            TextButton(
                // color: redColor,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DocSignUp()));
                },
                child: Text(
                  "SignUp",
                  style: TextStyle(color: whiteColor),
                )),
            TextButton(
                // color: redColor,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DocLogin()));
                },
                child: Text(
                  "SignIn",
                  style: TextStyle(color: whiteColor),
                )),
          ],
        ),
      ),
    );
  }
}
