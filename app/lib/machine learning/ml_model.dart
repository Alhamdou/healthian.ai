// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_null_comparison, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class MyModel extends StatefulWidget {
  const MyModel({Key? key}) : super(key: key);

  @override
  _MyModelState createState() => _MyModelState();
}

class _MyModelState extends State<MyModel> {
  bool loading = true;
  late File _image;
  late List _output;
  final imagepicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  detectimage(File image) async {
    var prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.8,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _output = prediction!;
      loading = false;
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model/model_unquant-1.tflite',
        labels: 'assets/model/labels-pne.txt');
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickimage_camera() async {
    var image = await imagepicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image);
  }

  pickimage_gallery() async {
    var image = await imagepicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Disease Classifier ',
          style: GoogleFonts.roboto(),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(10),
              // child: Image.asset('assets/mask.png'),
            ),
            Container(
                child: Text('Disease Detector',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(height: 50),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                        color: Colors.teal[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Capture',
                            style: GoogleFonts.roboto(fontSize: 18)),
                        onPressed: () {
                          pickimage_camera();
                        }),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                        color: Colors.teal[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Gallery',
                            style: GoogleFonts.roboto(fontSize: 18)),
                        onPressed: () {
                          pickimage_gallery();
                        }),
                  ),
                ],
              ),
            ),
            loading != true
                ? Container(
                    child: Column(
                      children: [
                        Container(
                          height: 220,
                          // width: double.infinity,
                          padding: EdgeInsets.all(15),
                          child: Image.file(_image),
                        ),
                        _output != null
                            ? Text(
                                (_output[0]['label']).toString().substring(2),
                                style: GoogleFonts.roboto(fontSize: 18))
                            : Text(''),
                        _output != null
                            ? Text(
                                'Confidence: ' +
                                    (_output[0]['confidence']).toString(),
                                style: GoogleFonts.roboto(fontSize: 18))
                            : Text('')
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
