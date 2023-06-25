// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class PopularDoctors {
  String name;
  String specialized;
  String country;
  String hostiptal;
  String image;

  PopularDoctors(
      this.name, this.hostiptal, this.specialized, this.country, this.image);
}

List<PopularDoctors> docs = Docs_info.map((item) => PopularDoctors(
    item['name'] ?? "",
    item['country'] ?? "",
    item['hospital'] ?? "",
    item['specialized'] ?? "",
    item['image'] ?? "")).toList();

var Docs_info = [
  {
    "name": "Dr. Dinesh",
    "specialized": "Brian surgeon",
    "hospital": "Max Health care",
    "country": "India",
    "image": "assets/images/Dr.Dinesh.jpg"
  },
  {
    "name": "Dr.Sandeep",
    "specialized": "Heart Sugeon",
    "hospital": "Max Health Care",
    "country": "India",
    "image": "assets/images/Dr.Sandeep.jpeg"
  },
  {
    "name": "Dr.Harit",
    "specialized": "Cancer Specialist",
    "hospital": "max health Care",
    "country": "India",
    "image": "assets/images/Dr_Harit.jpg"
  },
  {
    "name": "Dr.Anant",
    "specialized": "Kidney Transplant",
    "hospital": "MAX Health Care",
    "country": "India",
    "image": "assets/images/Dr_Anant.jpg"
  },
  {
    "name": "Dr.Subhash",
    "specialized": "Liver Surgeon",
    "hospital": "Max Health care",
    "country": "India",
    "image": "assets/images/Dr_SG.jpg"
  },
  {
    "name": "Dr.A.K Singh",
    "specialized": "Neurosurgery",
    "hospital": "Max Health Care",
    "country": "India",
    "image": "assets/images/Dr_A_K_Singh.jpg"
  },
];
