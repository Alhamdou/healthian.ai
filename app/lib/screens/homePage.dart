// ignore_for_file: unused_import, file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unnecessary_const, prefer_const_constructors, avoid_unnecessary_containers
import 'package:app/screens/pages/appoinments.dart';
import 'package:flutter/material.dart';
import 'package:app/doctors/popular_doctors/doc_detail.dart';
import 'package:app/doctors/popular_doctors/in-bookings.dart';
import 'package:app/screens/pages/my_doctors.dart';
import 'package:app/screens/hospitals.dart';
import 'package:app/screens/widgets/drawer_widget.dart';
import 'package:app/utls/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:app/patient registration/registration.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utls/style_constant.dart';
import 'doctors.dart';
import 'package:app/screens/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String name, required String urlImage})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> List_screens = <Widget>[
    HomePage(
      urlImage: '',
      name: '',
    ),
    // const HomeScreen(),
    const Doctors(),
    Hospitals(),
    const SettingsPage(),
  ];

  void _updateIndex(value) {
    setState(() {
      _currentIndex = value;
      // print(_currentIndex);
    });

    switch (value) {
      case 0:
        // navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(urlImage: '', name: "")),
        );
        break;
      case 1:
        // navigate to Doctors screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Doctors()),
        );
        break;
      case 2:
        // navigate to Stats screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Hospitals()),
        );
        break;
      case 3:
        // navigate to Settings screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      default:
        // navigate to HomeScreen by default
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: mButtonColor,
            elevation: 0,
            title: const Text(
              "Healthian.ai",
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 20.0,
                  fontFamily: "Arvo",
                  fontWeight: FontWeight.bold),
            )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: whiteColor,
          currentIndex: _currentIndex,
          onTap: _updateIndex,
          selectedItemColor: blackColor,
          unselectedItemColor: blackColor.withOpacity(0.6),
          selectedFontSize: 10,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedFontSize: 6,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            const BottomNavigationBarItem(
                icon: const Icon(Icons.medical_services), label: "Doctors"),
            const BottomNavigationBarItem(
                icon: const Icon(Icons.local_hospital_rounded), label: "Hospitals"),
            const BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: "Settings"),
          ],
        ),
        drawer: const NavigationDrawer(),
        // body: HomeScreen(),

        body: const HomeScreen());
    // body: List_screens[_currentIndex]);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Text("Hi, Welcome to healthian.ai",
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.5,
                    letterSpacing: .5)),
          ),

          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              height: 165,
              width: 0,
              decoration: BoxDecoration(
                  border: Border.all(color: mGreyColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  gradient: const LinearGradient(colors: [
                    const Color(0xff0191C9),
                    const Color(0xff26a0da)
                  ])),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xff0191C9),
                            radius: 60.0,
                            backgroundImage:
                                const AssetImage("assets/images/lady doc.jpg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, bottom: 40.0, top: 30.0),
                          child: Column(
                            children: [
                              Text(
                                "Healthian.ai is always\n at standby for your health",
                                style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    height: 1.26,
                                    letterSpacing: 0.05),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "check our service out ",
                                  style:
                                      GoogleFonts.ubuntu(color: Colors.black),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0, bottom: 10),
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Origianl Cut code stops here
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text(
              'Our Top Surgery Offerings.',
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Container(
            height: 144,
            width: 144,
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: mBlueColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icons/Neurosciences-icon.svg',
                              color: Colors.white,
                              fit: BoxFit.contain,
                              width: 35,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Neurosurgery',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white, fontSize: 15)),
                                  Text('Brain Surgery',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white, fontSize: 12)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: mBlueColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icons/Bone Marrow Transplant -icon.svg',
                              color: Colors.white,
                              fit: BoxFit.contain,
                              width: 31,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Bone Marow',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white, fontSize: 15)),
                                  Text('Bone Marrow ',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white, fontSize: 13)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: mBlueColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icons/Kidney Transplant.svg',
                              color: Colors.white,
                              width: 35,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Kidney',
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  Text(
                                    'KidneyStones',
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white, fontSize: 13),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: mBlueColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icons/cardia-icon.svg',
                              color: Colors.white,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Heart Disease',
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  Text(
                                    'Transplant',
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white, fontSize: 13),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text(
              'Meet Our Top Surgeons',
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Container(
            height: 205,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: In_visits.length,
              padding: const EdgeInsets.only(left: 16, right: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 140,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: mBorderColor, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            docs[index].image,
                            height: 74,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              docs[index].name,
                              style: docname,
                            ),
                          ),
                          Text(
                            docs[index].specialized,
                            style: docspcialized,
                          ),
                          Text(
                            docs[index].hostiptal,
                            style: dochospital,
                          ),
                          Text(
                            docs[index].country,
                            style: doccountry,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text("Our Trending Consultations",
                style: GoogleFonts.raleway(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13)),
          ),
          // ignore: sized_box_for_whitespace
          Container(
              height: 144,
              width: 144,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            return;
                          },
                          child: Row(
                            children: [
                              
                              Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    child: SizedBox(
                                      child: Image.asset(
                                        "assets/icons/cough.png",
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  ),
                                  Text("Skin issues",
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // Text(
                                  //   "Consult a doctor",
                                  //   style: consultaion_button,
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    child: SizedBox(
                                      child: SvgPicture.asset(
                                        "assets/icons/child.svg",
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  ),
                                  Text("child helath",
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  // Text(
                                  //   "Consult a doctor",
                                  //   style: consultaion_button,
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    child: SizedBox(
                                      child: Image.asset(
                                        "assets/icons/diabetes.png",
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  ),
                                  Text("Diabetes",
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  // Text(
                                  //   "Endcrinologist",
                                  //   style: consultaion_button,
                                  // ),
                                ],
                              ),
                              // Column(
                              //   children: [
                              //     Card(
                              //       elevation: 0,
                              //       shape: const CircleBorder(),
                              //       child: SizedBox(
                              //         child: Image.asset(
                              //           // C:\Users\LENOVO\Desktop\deep health Ai\app\assets\icons\Sexual_wellness.svg
                              //           "assets/icons/Stomach.png",
                              //           width: 90,
                              //           height: 70,
                              //         ),
                              //       ),
                              //     ),
                              //     Text("",
                              //         style: GoogleFonts.ubuntu(
                              //             fontWeight: FontWeight.bold,
                              //             fontSize: 15)),
                              //     // Text(
                              //     //   "Endcrinologist",
                              //     //   style: consultaion_button,
                              //     // ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(
              height: 144,
              width: 144,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            return;
                          },
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    child: SizedBox(
                                      child: Image.asset(
                                        "assets/icons/diet.png",
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  ),
                                  Text("Diet",
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  // Text(
                                  //   "Consult a dietician",
                                  //   style: consultaion_button,
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    child: SizedBox(
                                      child: Image.asset(
                                        "assets/icons/depression.png",
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  ),
                                  Text("Depression",
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  // Text(
                                  //   "Check a therapist",
                                  //   style: consultaion_button,
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    child: SizedBox(
                                      child: Image.asset(
                                        "assets/icons/fever.png",
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Fever",
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // Text(
                                  //   "Consult a doctor",
                                  //   style: consultaion_button,
                                  // )
                                ],
                              ),
                              Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    child: SizedBox(
                                      child: Image.asset(
                                        // C:\Users\LENOVO\Desktop\deep health Ai\app\assets\icons\Stomach.svg
                                        "assets/icons/Stomach.png",
                                        width: 70,
                                        // height: 70,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Diarrhea",
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // Text(
                                  //   "Consult a doctor",
                                  //   style: consultaion_button,
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text("Book And Appointment with our top doctors",
                style: GoogleFonts.raleway(
                    color: blackColor, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 262,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: In_visits.length,
              padding: const EdgeInsets.only(left: 16, right: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 140,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: mBorderColor, width: 1),
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          visits[index].image,
                          height: 104,
                          width: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            visits[index].title,
                            style: docname,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10),
                          child: Text(visits[index].Info,
                              style: GoogleFonts.roboto(
                                  fontSize: 12, color: Colors.black)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Appointments()));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF2C53B1)),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Text(visits[index].button,
                                    style: GoogleFonts.roboto(
                                        fontSize: 12, color: whiteColor))),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 5),
            child: Text(
              "Why Choose Healthian.ai",
              style: GoogleFonts.aBeeZee(
                  color: blackColor, fontWeight: FontWeight.bold),
            ),
          ),

          // Container(
          //   color: darkblue,
          //   height: 144,
          //   width: 144,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Card(
          //         clipBehavior: Clip.antiAlias,
          //         child: Column(
          //           children: [
          //            ListTile(
          //             leading: Icon(Icons.video_camera_back_rounded),
          //             title: Text("test"),
          //             subtitle:Text("test 2", style: TextStyle(color: Colors.white.withOpacity(0.6)),)
          //            ),
                    
          //           ],
          //         ),
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.only(
          //           left: 16.0,
          //           right: 16,
          //         ),
                  
          //         child: const Icon(
          //           Icons.video_call_sharp,
          //           size: 45,
          //           color: whiteColor,
          //         ),
          //       ),
          
          //     ],
          //   ),
          // ),
          

        ],
        
      ),
    );
  }
}
