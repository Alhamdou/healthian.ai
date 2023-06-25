// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HealthReminders extends StatefulWidget {
  const HealthReminders({Key? key}) : super(key: key);

  @override
  State<HealthReminders> createState() => _HealthRemindersState();
}

class HealthReminder {
  final String title;
  final String description;

  HealthReminder({required this.title, required this.description});
}

List<HealthReminder> healthReminders = [
  HealthReminder(
      title: "Get Enough Sleep",
      description:
          "Sleep is important for various aspects of brain function. This includes cognition, concentration, productivity and performance."),
  HealthReminder(
      title: "Drink Enough Water",
      description:
          "Drinking enough water can help improve energy levels and brain function. It also helps prevent and treat headaches and constipation."),
  HealthReminder(
      title: "Exercise Regularly",
      description:
          "Regular exercise can help prevent chronic diseases and improve mental health and physical fitness."),
  HealthReminder(
      title: "Eat a Healthy Diet",
      description:
          "Eating a healthy diet can help reduce the risk of chronic diseases, maintain a healthy weight and improve mental health."),
  HealthReminder(
      title: "Wash Your Hands Often",
      description:
          "Washing your hands with soap and water can help prevent the spread of infectious diseases."),
  HealthReminder(
      title: "Get Regular Checkups",
      description:
          "Regular checkups with a healthcare provider can help detect and treat health problems early."),
];

class _HealthRemindersState extends State<HealthReminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Reminders"),
      ),
      body: ListView.builder(
        itemCount: healthReminders.length,
        itemBuilder: (context, index) {
          HealthReminder reminder = healthReminders[index];
          return ListTile(
            title: Text(reminder.title),
            subtitle: Text(reminder.description),
          );
        },
      ),
    );
  }
}
