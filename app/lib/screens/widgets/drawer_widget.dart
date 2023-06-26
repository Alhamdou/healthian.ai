// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_unnecessary_containers, import_of_legacy_library_into_null_safe, unused_impe.dart';, prefer_const_declarations, non_constant_identifier_names, unused_import, no_duplicate_case_values, unused_local_variable



import 'package:app/machine%20learning/ml_model.dart';
import 'package:app/screens/doctors.dart';
import 'package:app/screens/homePage.dart';
import 'package:app/screens/pages/are_you_doctor.dart';
import 'package:app/utls/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/appoinments.dart';
import '../pages/consultation.dart';
import '../pages/deepay.dart';
import '../pages/insurance.dart';
import '../pages/medical_records.dart';
import '../pages/my_doctors.dart';
import '../pages/orders.dart';
import '../pages/reminders.dart';
import '../pages/signout.dart';

class NavigationDaw extends StatefulWidget {
  const NavigationDaw({Key? key}) : super(key: key);

  @override
  State<NavigationDaw> createState() => _NavigationDawState();
}

class _NavigationDawState extends State<NavigationDaw> {
  final Padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = "name";
    final email = "me@gmail.com";
    // final UrlImage =
    //     "https://mymodernmet.com/wp/wp-content/uploads/2019/09/100k-ai-faces-1.jpg";
    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
              // urlImage: UrlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(
                  name: '', urlImage: '',
                  // urlImage: UrlImage,
                ),
              )),
              urlImage: '',
            ),
            Container(
              padding: Padding,
              child: Column(
                children: [
                  const SizedBox(height: 0),
                  // buildSearchField(),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'My Doctors',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Medical Records',
                    icon: Icons.document_scanner_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  // const SizedBox(height: 10),
                  // buildMenuItem(
                  //   text: 'Consultaion',
                  //   icon: Icons.workspaces_outline,
                  //   onClicked: () => selectedItem(context, 2),
                  // ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Insurance Policy',
                    icon: Icons.policy,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'PharmStore',
                    icon: Icons.online_prediction_rounded,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Appointments',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 10),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'DeePay',
                    icon: Icons.monetization_on,
                    onClicked: () => selectedItem(context, 6),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Health Reminders',
                    icon: Icons.notifications_outlined,
                    onClicked: () => selectedItem(context, 7),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Are You A Doctor',
                    icon: Icons.people_alt,
                    onClicked: () => selectedItem(context, 8),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'SignOut',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 9),
                  ),
                  Divider(height: 20,),
                  const SizedBox(height: 10,),
                  Text("Crafted with ❤️ by Alhamdu scientist Jallow", style: TextStyle(color: whiteColor, fontSize: 12),)
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: Padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),

              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              // Spacer(),
              // CircleAvatar(
              //   radius: 18,
              //   backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              //   child: Icon(Icons.add_comment_outlined, color: Colors.white),
              // )
            ],
          ),
        ),
      );

  // Widget buildSearchField() {
  //   final color = Colors.white;

  //   return TextField(
  //     style: TextStyle(color: color),
  //     decoration: InputDecoration(
  //       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //       hintText: 'Search',
  //       hintStyle: TextStyle(color: color),
  //       prefixIcon: Icon(Icons.search, color: color),
  //       filled: true,
  //       fillColor: Colors.white12,
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(color: color.withOpacity(0.7)),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(color: color.withOpacity(0.7)),
  //       ),
  //     ),
  //   );
  // }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyDoctors(
            urlImage: '',
            name: '',
          ),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MedicalReports(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Consultation(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InsurancePage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DrugList(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Appointments(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PaymentPage(),
        ));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HealthReminders(),
        ));
        break;
      case 8:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RealDoctors(),
        ));
        break;
      case 9:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SignOutScreen(),
        ));
        break;
    }
  }
}
