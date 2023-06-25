// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _verifyPhoneNumber(BuildContext context) async {
//     final PhoneVerificationCompleted verificationCompleted =
//         (PhoneAuthCredential credential) async {
//       await _auth.signInWithCredential(credential);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Verification completed')),
//       );
//     };

//     final PhoneVerificationFailed verificationFailed =
//         (FirebaseAuthException exception) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Verification failed: ${exception.message}')),
//       );
//     };

//     final PhoneCodeSent codeSent =
//         (String verificationId, [int? forceResendingToken]) async {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Verification code sent')),
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EnterCodeScreen(verificationId),
//         ),
//       );
//     };

//     final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verificationId) {};

//     await FirebaseAuthPhoneAuthProvider(
//       firebaseAuth: _auth,
//     ).verifyPhoneNumber(
//       phoneNumber: '+123456789', // Replace with the desired phone number
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: verificationCompleted,
//       verificationFailed: verificationFailed,
//       codeSent: codeSent,
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Phone Auth Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Phone Auth Demo'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () => _verifyPhoneNumber(context),
//             child: Text('Sign In with Phone Number'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class EnterCodeScreen extends StatefulWidget {
//   final String verificationId;

//   EnterCodeScreen(this.verificationId);

//   @override
//   _EnterCodeScreenState createState() => _EnterCodeScreenState();
// }

// class _EnterCodeScreenState extends State<EnterCodeScreen> {
//   TextEditingController _codeController = TextEditingController();

//   void _submitCode() async {
//     String smsCode = _codeController.text.trim();

//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: smsCode,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Verification completed')),
//       );

//       // Navigate to the next screen after successful verification
//       // Replace `NextScreen` with your desired screen
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => NextScreen(),
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Invalid verification code')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter Verification Code'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: _codeController,
//                 decoration: InputDecoration(
//                   labelText: 'Verification Code',
//                 ),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _submitCode,
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NextScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Next Screen'),
//       ),
//       body: Center(
//         child: Text('You are logged in!'),
//       ),
//     );
//   }
// }
