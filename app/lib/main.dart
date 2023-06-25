// ignore_for_file: prefer_const_constructors, unused_import

import 'package:app/doctors/popular_doctors/doc_home_page.dart';
import 'package:app/machine%20learning/ml_model.dart';
import 'package:app/patient%20registration/registration.dart';
import 'package:app/screens/doctors.dart';
import 'package:app/screens/homePage.dart';
import 'package:app/screens/pages/are_you_doctor.dart';
import 'package:app/screens/spalshPages/firstpage.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Patient Login/Login.dart';
// import 'signup data/registration.dart';
// import 'package:firebase_options.dart';
// import 'signup data/private_doctor_signup.dart';
// import 'screens/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Healthian",
      theme: ThemeData(primarySwatch: Colors.teal),
      // home: HomePage(
      //   urlImage: '',
      //   name: '',
      // ),
      home: FirstScreen1(),
      // home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "./patient registration": (BuildContext context) =>
            const RegistrationScreen(),
        "./patient login": (BuildContext context) => const LoginScreen(),
        "./home page": (BuildContext context) => HomePage(
              urlImage: '',
              name: '',
            ),
        // "doc"
      },
    );
  }
}
