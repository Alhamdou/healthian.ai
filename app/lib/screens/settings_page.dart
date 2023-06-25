import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  double _fontSize = 16.0;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20.0),
          ListTile(
            title: const Text('Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: _darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _darkModeEnabled = value;
                });
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Font Size'),
            trailing: DropdownButton<double>(
              value: _fontSize,
              onChanged: (value) {
                setState(() {
                  _fontSize = value!;
                });
              },
              items: <double>[14.0, 16.0, 18.0, 20.0, 22.0].map((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
              items: <String>['English', 'French', 'Spanish', 'German'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // perform logout
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
