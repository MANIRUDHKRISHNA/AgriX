import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String userType;

  AppDrawer({required this.userType});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('$userType Profile', style: TextStyle(color: Colors.white, fontSize: 24)),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Handle Profile tap
            },
          ),
          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text('Customer Support'),
            onTap: () {
              // Handle Customer Support tap
            },
          ),
          if (userType == 'Farmer') ...[
            ListTile(
              leading: Icon(Icons.lightbulb),
              title: Text('Tips'),
              onTap: () {
                // Handle Tips tap
              },
            ),
          ],
        ],
      ),
    );
  }
}
