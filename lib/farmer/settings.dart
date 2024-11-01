// settings.dart

import 'package:agrix/farmer/Privacy%20Policy.dart';
import 'package:agrix/farmer/Terms%20and%20Conditions.dart';
import 'package:flutter/material.dart';
import'package:agrix/main.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;
  String _language = 'English';
  List<String> _languages = ['English', 'Spanish', 'French'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dark Mode Setting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode'),
                Switch(
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() {
                      _darkMode = value;
                    });
                  },
                ),
              ],
            ),
            Divider(thickness: 1),

            // Notifications Setting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications'),
                Switch(
                  value: _notifications,
                  onChanged: (value) {
                    setState(() {
                      _notifications = value;
                    });
                  },
                ),
              ],
            ),
            Divider(thickness: 1),

            // Language Setting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Language'),
                DropdownButton<String>(
                  value: _language,
                  items: _languages.map((String language) {
                    return DropdownMenuItem<String>(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _language = newValue!;
                    });
                  },
                ),
              ],
            ),
            Divider(thickness: 1),

            // Terms and Conditions
            ListTile(
              title: Text('Terms and Conditions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsandConditionsScreen()),
                );
                // Navigate to Terms and Conditions screen
              },
            ),
            Divider(thickness: 1),

            // Privacy Policy
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                // Navigate to Privacy Policy screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
                );
              },
            ),
            Divider(thickness: 1),

            // Logout
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()),);
                // Logout functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}