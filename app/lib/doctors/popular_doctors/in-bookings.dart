// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class PopularInvisits {
  String title;
  String Info;
  String image;
  String button;

  PopularInvisits(this.title, this.Info, this.image, this.button);
}

List<PopularInvisits> visits = In_visits.map((item) => PopularInvisits(
      item['title'] ?? "",
      item['Info'] ?? "",
      item['image'] ?? "",
      item['button'] ?? "",
    )).toList();

var In_visits = [
  {
    "title": "Denstist",
    "Info": "Teeth troubles? Schedules for dental service Asap!",
    "image": "assets/images/dentist-1.jpg",
    "button": "Book Now !"
  },
  {
    "title": "Nutrionist",
    "Info": "Teeth troubles? Schedules for dental service Asap!",
    "image": "assets/images/nutritionist-1.jpg",
    "button": "Book Now !"
  },
  {
    "title": "Gynecologist",
    "Info": "Teeth troubles? Schedules for dental service Asap!",
    "image": "assets/images/gynecologist.jpg",
    "button": "Book Now !"
  },
  {
    "title": "Physiotherapist",
    "Info": "Teeth troubles? Schedules for dental service Asap!",
    "image": "assets/images/Physiothrapist.jpg",
    "button": "Book Now!"
  },
  {
    "title": "Orthopedist",
    "Info": "Teeth troubles? Schedules for dental service Asap!",
    "image": "assets/images/orthopedist.jpg",
    "button": "Book Now!"
  },
  {
    "title": "Surgeon",
    "Info": "Teeth troubles? Schedules for dental service Asap!",
    "image": "assets/images/surgeons.jpg",
    "button": "Book Now!"
  },
];
