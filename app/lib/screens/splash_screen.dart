// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

// import 'package:app/screens/homePage.dart';
import 'package:app/utls/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../Patient Login/Login.dart';
import '../patient registration/registration.dart';
// import 'package:google_sign_in/google_sign_in.dart';


  
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        elevation: 0,
        title: const Text(
          "Healthian.ai",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: "Arvo",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 40),
              child: SvgPicture.asset(
                "assets/icons/new_docs.svg", 
                fit: BoxFit.contain,
                height: 140,
                width: 80,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [mBackgroundColor, mBackgroundColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Healthian',
                      style: TextStyle(
                        fontSize: 32,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'We love and care for you and your family \n'
                      'The perfect health structure for all family and friends',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: blackColor,
                    fontFamily: "Raleway",
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                            top: 0,
                            bottom: 12,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginScreen();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 22),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: redColor,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 30,
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                            top: 0,
                            bottom: 12,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const RegistrationScreen();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'SignUp',
                              style: TextStyle(fontSize: 22),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: redColor,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 30,
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                    Container(
                      child: Column(children: [
                        Divider(height: 15,),
                        Row(mainAxisAlignment: MainAxisAlignment.center),
                        
                        Container(
                          child: Text("Or SignUp With"),
                          
                          padding: EdgeInsets.all(10)
                          
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                child: Image.asset("assets/images/google_1.png"),
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Container(
                              child: Image.asset("assets/images/facebook.jpg"),
                              height: 40,
                          width: 40,
                        ),
                        
                        // Container(child: SvgPicture.asset("assets/images/apple.svg"), height: 40, width: 40,)
                        
                          
                      ]
                      
                      ),
                      SizedBox(height: 20,),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistrationScreen()));
                            },
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                  color: mButtonColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ])
        )],
                ),
              ),
              
            ),
            
          ],
        ),
        
      ),
    );
  }
}