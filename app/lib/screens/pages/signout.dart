import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Patient Login/Login.dart';

class SignOutScreen extends StatelessWidget {
  const SignOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Out'),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/images/logout.png",
            height: 200,
            width: 150,
          ),
          const Text("Thanking for for checing on us!"),
          Center(
            child: ElevatedButton(
              child: const Text('Sign Out'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
