import 'package:flutter/material.dart';
import 'farmer/farmer_home_page.dart';
import 'customer/customer_home_page.dart';

class LoginScreen extends StatelessWidget {
  final String userType;

  LoginScreen({required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],

      appBar: AppBar(title: Text('$userType Login'),backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login as $userType',style:TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (userType == 'Farmer') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerHomePage()),
                  );
                }
              },
              child: Text('Login',style:TextStyle(fontSize:25,fontWeight: FontWeight.bold),
            ),
            ),
        ],
      ),
    ));
  }
}
